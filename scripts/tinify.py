import asyncio
import base64
import hashlib
import os
import sys
from pathlib import Path

import aiofiles  # type: ignore
import aiohttp
import dotenv

dotenv.load_dotenv()

BATCH_SIZE = 10
TINIFY_LOG = ".tinify.db"
API_KEY = os.getenv("TINIFY_KEY")
VALID_EXTENSIONS = {".png", ".jpg", ".jpeg", ".webp", ".avif"}
DOCS_DIR = "docs"


class Tinify:
    def __init__(self, key: str):
        self.key = key
        self.base_url = "https://api.tinify.com/shrink"

    async def compress(self, src: str, dst: str | None = None):
        if not Path(src).exists():
            raise FileNotFoundError(f"File {src} not found")

        if not dst:
            dst = src

        auth_header = base64.b64encode(f"api:{self.key}".encode()).decode()
        headers = {
            "Authorization": f"Basic {auth_header}",
        }

        async with aiofiles.open(src, "rb") as file:
            data = await file.read()

        async with aiohttp.ClientSession() as session:
            async with session.post(
                self.base_url, data=data, headers=headers
            ) as response:
                if response.status == 201:
                    result = await response.json()
                    compressed_url = result["output"]["url"]
                    await self._download(compressed_url, dst)
                else:
                    raise RuntimeError(f"Failed to compress image {src}")

    async def _download(self, url: str, dst: str):
        async with aiohttp.ClientSession() as session:
            try:
                async with session.get(url) as response:
                    response.raise_for_status()
                    async with aiofiles.open(dst, "wb") as file:
                        async for chunk in response.content.iter_chunked(1024):
                            await file.write(chunk)
            except Exception:
                raise RuntimeError(f"Failed to download image {url}")


async def hashify(src: str) -> str:
    async with aiofiles.open(src, "rb") as file:
        return hashlib.sha256(await file.read()).hexdigest()


async def is_compressed(src: str) -> bool:
    hash = await hashify(src)

    if not Path(TINIFY_LOG).exists():
        return False

    async with aiofiles.open(TINIFY_LOG, "r") as log:
        return hash in await log.read()


async def mark_compressed(src: str):
    hash = await hashify(src)
    async with aiofiles.open(TINIFY_LOG, "a") as log:
        await log.write(f"{hash}\n")


async def get_uncompressed_images(src: str) -> list[str]:
    if not Path(src).exists():
        return []

    images = []
    for file in Path(src).rglob("*"):
        if file.suffix.lower() in VALID_EXTENSIONS:
            if not await is_compressed(file.as_posix()):
                images.append(file.as_posix())

    return images


async def compress_images(src: str):
    if not Path(src).exists():
        return

    images = await get_uncompressed_images(src)

    if not API_KEY:
        raise RuntimeError("TINIFY_KEY not set in .env")

    tinify = Tinify(API_KEY)

    for i in range(0, len(images), BATCH_SIZE):
        batch = images[i : i + BATCH_SIZE]
        tasks = [tinify.compress(file) for file in batch]
        results = await asyncio.gather(*tasks, return_exceptions=True)

        for file, result in zip(batch, results):
            if isinstance(result, Exception):
                raise Exception(f"Failed to compress {file}")
            else:
                print(f"Compressed {file}")
                await mark_compressed(file)


async def main():
    try:
        await compress_images(DOCS_DIR)
    except Exception as e:
        sys.exit(str(e))


if __name__ == "__main__":
    asyncio.run(main())
