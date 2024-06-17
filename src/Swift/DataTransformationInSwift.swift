import Foundation

// map

let names = ["Alice", "Bob", "Charlie"]
let uppercaseNames = names.map { $0.uppercased() }
print(uppercaseNames) // ["ALICE", "BOB", "CHARLIE"]

// flatMap

struct Order {
    let items: [String]
}

let orders = [
    Order(items: ["A", "B"]),
    Order(items: ["C", "D"])
]

let allItem = orders.flatMap { $0.items }
print(allItem) // ["A", "B", "C", "D"]

// compactMap

let ages = ["25", "unknown", "30"]
let validAges = ages.compactMap { Int($0) }
print(validAges) // [25, 30]
