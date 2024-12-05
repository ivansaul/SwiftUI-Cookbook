---
comments: true
icon: fontawesome/brands/telegram
title: Teldrive free unlimited cloud storage
description: How to get unlimited free cloud storage. Teldrive is a free and open-source alternative to Google Drive, Dropbox, and OneDrive. It is a self-hosted file storage system that allows us to store our files in the cloud and share them with others.
---

# Teldrive Free Unlimited Cloud Storage

`Teldrive` is a free and open-source alternative to `Google Drive`, `Dropbox`, `OneDrive`, etc. It is a self-hosted file storage system that allows us to store our files in the cloud and share them with others. Teldrive uses the `Telegram API` for the free unlimited cloud storage.

## Prerequisites

Before starting, make sure you have active [Telegram](https://telegram.org/) and [Supabase](https://supabase.com/) accounts.

### Creating a Telegram application

Follow the [official guide](https://core.telegram.org/api/obtaining_api_id) to create a new Telegram application. After creating the application, you will get an `APP api_id` and `APP api_hash`. Copy these values and save them somewhere safe.

### Creating a Telegram bot

Create a new Telegram bot by following the [official guide](https://core.telegram.org/bots#how-do-i-create-a-bot). After creating the bot, you will get a `BOT token`. Copy this value and save it somewhere safe.

!!! tip
    Create at least a couple of bots for better teldrive performance.

### Creating a Supabase project

- Go to [Supabase Dashboard](https://supabase.com/dashboard/projects) and create a new project.

![alt text](../../assets/images/teldrive-free-unlimited-cloud-storage-image.png)

- After creating the project, we need to reveal the `connections string URI`, click on the `connect` button on the top right corner of the window.

<figure markdown="span">
![alt text](../../assets/images/teldrive-free-unlimited-cloud-storage-image-1.png){ width=300 }
</figure>

- Copy the `connection string URI` and save it somewhere safe. The `password` is the previous `password` we used when creating the project.

![alt text](../../assets/images/teldrive-free-unlimited-cloud-storage-image-2.png)

## Setting up Teldrive

The setup process a quite simple. Just follow the steps below:

- Download the `teldrive` binary for your system from the [release page](https://github.com/tgdrive/teldrive/releases).

- Create a `config.toml` file in the same directory as the `teldrive` binary.

```toml title="config.toml"
[db]
data-source = "postgresql://postgres.[PROJECT-ID]:[YOUR-PASSWORD]@aws-.../postgres" # (1)!
prepare-stmt = false

[db.pool]
enable = false

[jwt]
allowed-users = ["YOUR-TELEGRAM-USERNAME"]
secret = "YOUR-SECRET" # (2)!

[tg]
app-id = 123456789 # (3)!
app-hash = "abcdefghijklmnopqrstuvwxyz" # (4)!
session-file = "session.db"
```

1. Replace `[PROJECT-ID]` and `[YOUR-PASSWORD]` with the values you got previously.

2. Generate a random string for `[YOUR-SECRET]` from [here](https://generate-secret.vercel.app/64).

3. Replace with your Telegram `app_id` from the previous step.

4. Replace with your Telegram `app_hash` from the previous step.

!!! note
    For more information about the configuration file, check the [official documentation](https://github.com/tgdrive/teldrive)

### Running Teldrive

Once you have completed the configuration and the installation, you can start teldrive by running the following command:

```bash
./teldrive run -c config.toml # (1)!
```

1. Windows users should use `.\teldrive.exe run -c config.toml` instead.

??? note "Linux and macOS"
    If you are using Linux or MacOS, you need to make the binary executable first. You can do this by running the following command:

    ```bash
    chmod +x teldrive
    ```

Now, you can access your Teldrive instance by visiting `http://localhost:8080` in your browser.

### Account setup

After starting teldrive, login using your Telegram credentials.

<figure markdown="span">
![alt text](../../assets/images/teldrive-free-unlimited-cloud-storage-image-3.png){ width=300 }
</figure>
Go to the `Settings`, and click on the `Account` tab.

![alt text](../../assets/images/teldrive-free-unlimited-cloud-storage-image-4.png)

1. Add the `Telegram bots` that previously created. You can add as many bots as you want.
2. Select the `Telegram channel` that `Teldrive` will use to save your files.

That's it! Now you have a working `Teldrive` instance.

![alt text](../../assets/images/teldrive-free-unlimited-cloud-storage-image-5.png)
