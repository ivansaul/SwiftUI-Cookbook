---
comments: true
icon: material/file-document-plus-outline
title: Extensions in Swift
description: Discover the power of Swift extensions to enhance existing types with new methods, properties, and initializers. Learn how to customize and expand your code effortlessly while keeping it clean and modular.
---

# Extensions in Swift

`Extensions` in Swift allow us to add new functionality to existing `Classes`, `Structures`, `Enumerations`, or `Protocol` types. This includes adding new methods, properties, initializers, and more. Extensions are particularly useful for organizing and modularizing our code without needing to modify the original type, especially when we don't have access to the original source code.

## Extension syntax

To create an extension, we use the `extension` keyword followed by the name of the type we want to extend.

```swift
extension SomeType {
    // New functionalities to be added
}
```

Let's explore some practical examples to understand how extensions work in Swift.

## Adding custom functionality to existing types

### Adding computed properties

Extensions allow us to add computed properties. For example, we can add a computed property that determines if an integer is even or odd.

```swift
extension Int {
    var isEven: Bool {
        self % 2 == 0
    }
}

print(4.isEven) // Outputs: true
print(7.isEven) // Outputs: false
```

### Adding Methods

Suppose we have a `String` type and want to add a method that reverses the string. Instead of modifying the `String` type itself, we can create an extension that adds a new method.

```swift
extension String {
    func reverse() -> String {
        String(self.reversed())
    }
}

print("abc".reverse()) // Outputs: cba
```

If a method needs to modify (or mutate) the instance itself, we need to mark the method as `mutating`. The example below adds a new mutating method called square to Swift’s Int type, which squares the original value.

```swift
extension Int {
    mutating func square() {
        self = self * self
    }
}

var number = 5
number.square()
print(number) // Outputs: 25
```

### Adding Initializers

Extensions can also provide additional initializers. For example, we can add an initializer that creates a `Date` instance from a timestamp.

```swift
extension Date {
    init?(timestamp: Double) {
        self.init(timeIntervalSince1970: timestamp)
    }
}

let timestamp = 1693982400.0 // Unix timestamp for 2023-09-06 06:40:00
if let date = Date(timestamp: timestamp) {
    print(date) // Outputs: 2023-09-06 06:40:00 +0000
}
```

### Adding Subscripts

Extensions can add new subscripts to an existing type. For example, we can add a subscript that returns the character at a given index in the string.

```swift
extension String {
    subscript(index: Int) -> Character {
        self[self.index(startIndex, offsetBy: index)]
    }
}

print("Swift"[1]) // Outputs: w
```

## Adding functionality to custom types

### Adding computed properties

We can also add computed properties to a type using extensions. For instance, for the `Person` class, we might add a computed property that determines if the person is an adult.

```swift
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person {
    var isAdult: Bool {
        return age >= 18
    }
}

print(person.isAdult) // Outputs: true
```

### Adding methods

Suppose we have a `Circle` class and want to add a method that calculates the area of the circle. We can do this using extensions.

```swift
class Circle {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }
}

extension Circle {
    func area() -> Double {
        return 3.14 * radius * radius
    }
}

let circle = Circle(radius: 5.0)
print(circle.area()) // Outputs: 78.5
```

## Constraints for extensions

Constraints on extensions in Swift allow us to extend a type only when it meets certain conditions. This is especially useful when we want to add functionality to a type that conforms to a specific protocol or has certain properties.

In the example below, we will create an extension on Array that only works when the elements of the array conform to the Numeric protocol. We will add a method called sum() that calculates the sum of the elements in the array.

```swift
extension Array where Element: Numeric {
    func sum() -> Element {
        reduce(0, +)
    }
}

let numbers = [1, 2, 3, 4, 5]
print(numbers.sum()) // Outputs: 15

let doubles = [1.5, 2.5, 3.5]
print(doubles.sum()) // Outputs: 7.5

// This will not work because String is not Numeric
// let strings = ["a", "b", "c"]
// print(strings.sum())
// Error: Cannot invoke 'sum' with an array of strings
```

## Protocol extensions

In Swift, we can also extend protocols. It works pretty much like abstract classes when regarding a functionality we want to be available in all the classes that implements some protocol (without having to inherit from a base common class).

```swift
// Define a protocol
protocol Describable {
    func describe() -> String
}

// Provide a default implementation using a protocol extension
extension Describable {
    func describe() -> String {
        "This is a generic description"
    }
}

// Define a struct that conforms Describable protocol
struct Person: Describable {
    var name: String
    var age: Int

    // Overriding the default implementation
    func describe() -> String {
        "My name is \(name) and I am \(age) years old."
    }
}

struct Employee: Describable {
    var name: String
    var age: Int

    // Using the default implementation
}

// By just implementing the protocol the describe() method is available

let person = Person(name: "Ivan", age: 21)
let employee = Employee(name: "Saul", age: 25)

print(person.describe()) // Outputs: My name is Ivan and I am 21 years old.
print(employee.describe()) // Outputs: This is a generic description
```
