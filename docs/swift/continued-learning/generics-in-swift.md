# Generics in Swift

Swift Generics allow us to write reusable functions and data structures that can work with any type. We can write clear and concise code that works for any type, this reduces the risk of introducing bugs.

## Generic Functions

In Swift, we can create a function that works with any type. For example, suppose we want to create a function that swaps two values of any type.

```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = 10
var b = 20
swapValues(&a, &b)
print(a) // Output: 20
print(b) // Output: 10

var c = "Hello"
var d = "World"
swapValues(&c, &d)
print(c) // Output: "World"
print(d) // Output: "Hello"
```

In the example above, we have created a generic function called `swapValues()` that takes two values of any type and swaps them. The placeholder `T` is a generic type parameter, meaning it can be any type (e.g. `Int`, `String`, etc.).

{% hint style="info" %}
We can provide more than one type parameter by writing multiple type parameters names within the angle brackets, separated by commas: `func foo<T, U>(a: T, b: U)`.
{% endhint %}

{% hint style="info" %}
It's traditional to name the type parameters using single letters such as `T`, `U` and `V`, but we can use any upper camel case names (such as `MyType` or `MyOtherType`) to indicate that they are a placeholder for a type.
{% endhint %}

## Generic Data Structures

Generics are not limited to functions. We can use them to define generic data structures like classes, structs, and enums.

```swift
struct Box<T> {
    var value: T
}
let intBox = Box(value: 10)
let stringBox = Box(value: "Hello")

print(intBox.value) // Output: 10
print(stringBox.value) // Output: "Hello"
```

In the example above, `Box` is a generic data structure that can hold any type of value. We create two instances of `Box`, one with an `Int` value and one with a `String` value.

## Constraints on Generics

Sometimes, we want to add some restrictions to what types can be used with a generic. Swift allows us to specify constraints on generics to ensure they conform to a certain protocol.

```swift
func sum<T: Numeric>(_ array: [T]) -> T {
    array.reduce(0, +)
}

print(sum([1, 1.5, 2])) // Output: 4.5

// This will not work because String is not Numeric
// print(sum(["a", "b", "c"]))
// Error: function 'sum' requires that 'String' conform to 'Numeric'
```

In the example above, the generic function `sum()` is created with type constraints. This means `sum()` can only work with types that conform to the `Numeric` protocol (e.g. `Int`, `Double`, etc.).

{% hint style="info" %}
If we want to pass a type that does not conform to the `Numeric` protocol like `String`, we'll get an error:
`function 'sum' requires that 'String' conform to Numeric`
{% endhint %}

## Generic Protocols

Generic can also be used with protocols. This allows for even more flexible and reusable code.

```swift
protocol Storage {
    associatedtype Item
    func store(item: Item)
    func retrieve() -> Item?
}

class SimpleStorage<T>: Storage {
    private var items: [T] = []

    func store(item: T) {
        items.append(item)
    }

    func retrieve() -> T? {
        return items.isEmpty ? nil : items.removeLast()
    }
}

let intStorage = SimpleStorage<Int>()
intStorage.store(item: 42)
print(intStorage.retrieve() ?? "Empty")  // Output: 42
```

In the example above, the `Storage` protocol has an `associatedtype` called `Item`. The `SimpleStorage` class conforms to the `Storage` protocol with a specific type `T` that is determined when the class is instantiated.

{% hint style="info" %}
**Associated type** are used in protocols to define a placeholder for a type that will be specified later. They act as a generic placeholder. The exact type isn't defined in the protocol itself; instead, it's determined when a class, struct, or enum conforms to the protocol.
{% endhint %}

## Generic Typealiases

Generic typealiases allow us to create a new name for an existing type (i.e., they would not introduce a new type). Let's see an example below.

```swift
typealias StringDictionary<T> = [String: T]
typealias IntFunction<T> = (Int) -> Int
typealias Vector<T> = (T, T, T)
```
