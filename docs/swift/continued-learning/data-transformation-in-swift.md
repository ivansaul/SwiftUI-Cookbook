# Data Transformation in Swift

{% hint style="success" %}
[**Source Code**](../../../src/Swift/DataTransformationInSwift.swift) <img src="../../.gitbook/assets/github-logo-icon.svg" alt="" data-size="original">
{% endhint %}

Swift offers a rich toolkit for manipulating collections of data. When it comes to transforming elements within a collection, four key functions shine: `map`, `flatMap`, `compactMap`, and `tryMap`. While they share similarities, each tackles a specific data transformation scenario. Let's delve into their functionalities and explore when to use each one effectively.

## `map`: The Versatile Transformer

Imagine you have a list of names and want to convert them all to uppercase. `map` comes to the rescue! It applies a transformation you define (using a closure) to each element in a collection and returns a new collection with the transformed results.

Here's an example:

```swift
let names = ["Alice", "Bob", "Charlie"]
let uppercaseNames = names.map { $0.uppercased() }
print(uppercaseNames) // ["ALICE", "BOB", "CHARLIE"]
```

In this instance, the closure `$0.uppercased()` capitalizes each name in the `names` list. `map` creates a new list (`uppercaseNames`) containing the transformed names.

## `flatMap`: Unnesting Collections with Ease

What if your collection contains nested collections, and you want to create a single, flat list? Enter `flatMap`. It iterates through a collection, applies a transformation, and then "flattens" the results into a single collection.

Consider a list of customer orders, where each order has a list of items:

```swift
struct Order {
  let items: [String]
}

let orders = [
  Order(items: ["A", "B"]),
  Order(items: ["C", "D"])
]
```

We can use `flatMap` to extract all items from these orders into a single list:

```swift
let allItems = orders.flatMap { $0.items }
print(allItems) // ["A", "B", "C", "D"]
```

`flatMap` transforms each order by returning its `items` list. Since these are nested lists, `flatMap` flattens them into a single list containing all the individual items.

## `compactMap`: Filtering and Transforming Simultaneously

Sometimes, you might have a collection containing optional values (`nil` or a valid value). `compactMap` is your friend here. It applies a transformation like `map`, but it also filters out any optional values that turn into `nil` during the transformation.

For example, suppose you have a list of ages stored as strings, but some might be invalid:

```swift
let ages = ["25", "unknown", "30"]
```

You can use `compactMap` to convert valid ages to integers and discard any invalid strings:

```swift
let validAges = ages.compactMap { Int($0) }
print(validAges) // [25, 30]
```

Here, `compactMap` attempts to convert each age string to an integer using `Int($0)`. If the conversion fails (e.g., for "unknown"), `compactMap` discards it. Otherwise, it includes the converted integer in the new `validAges` list.

## `tryMap`: Handling Errors During Transformation

When dealing with functions that might throw errors, `tryMap` provides a safe way to transform elements. It's similar to `map`, but it can handle errors that arise during the transformation.

Imagine a function `calculateDiscount` that throws an error for invalid product IDs:

```swift
func calculateDiscount(productId: String) throws -> Double {
  // Logic to calculate discount (potentially throwing an error)
}
```

Let's say you have a list of product IDs and want to calculate discounts, but some IDs might be invalid:

```swift
let productIds = ["A123", "invalid", "B456"]
```

With `tryMap`, you can attempt the calculation while catching any errors:

```swift
do {
  let discounts = try productIds.tryMap { try calculateDiscount(productId: $0) }
  print(discounts) // [calculated discount for A123, calculated discount for B456]
} catch {
  print("Error calculating discount: \(error)")
}
```

`tryMap` tries to call `calculateDiscount` for each ID. If successful, it includes the calculated discount in the `discounts` list. If an error occurs (e.g., for "invalid" ID), `tryMap` throws the error
