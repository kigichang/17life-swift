# Swift Language Guide - String and Characters

**Swift’s String type is bridged seamlessly to Foundation’s NSString class.**

在 Cocoa Foundation Framework API 中有 `NSString` 可以用 `String`。

## Initialize Empty String

```swift
let emptyString = ""

let anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}


let nilString: String = nil	// compile error
```

## Immutable and Mutable String

```swift
var variableString = "Horse"

variableString += " and carriage"

print(variableString)

let constantString = "Highlander"		// constant string

constantString += " and another Highlander"		// compile error
```

## Strings are Value Type

Swift’s String 是 **Value Type**. 與大多數的程式語言不同，像 Java 的 String 是 Reference Type。 

## String is a collection of Characters

```swift
for char in "Dog!🐶".characters {
    print(char)
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
```

## String Interpolation

類似 C 的 `print("%d, %s", a, b)` 的效果。

```swift
let a = 1.0
let b = 2.0

print("\(a) + \(b) = \(a + b)")
```

## Unicode

```swift
let dollarSign = "\u{24}"
print(dollarSign)

let blackHeart = "\u{2665}"
print(blackHeart)

let sparklingHeart = "\u{1F496}"
print(sparklingHeart)
```

## Extended Grapheme Clusters

“An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.”

```swift
let eAcute: Character = "\u{E9}"
print(eAcute)

let e = "\u{65}"
print(e)
let t = "\u{301}"
print(t)

let combine: Character = "\u{65}\u{301}"
print(combine)

print(eAcute == combine)

let precomposed: Character = "\u{D55C}"
print(precomposed)


let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
print(decomposed)

let U: Character = "\u{1F1FA}"
print(U)

let S: Character = "\u{1F1F8}"
print(S)

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
print(regionalIndicatorForUS)
```

### Counting Characters

一般 String，計算字元數, eg:

```swift
let penguin = "Penguin 🐧"
print("\(penguin) has \(penguin.characters.count) characters")

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
```

Extended Grapheme Clusters 計算字元數：

```swift
var word = "cafe"
print("\(word) has \(word.characters.count)")

word += "\u{301}"
print("\(word) has \(word.characters.count)")
```


## Accessing and Modifying a String

### String Indices

Swift String 定位並沒有像大多數的程式語言，用數字來定位，而是內含一種 `Index` 的機制。

```swift
print("Empty start index: \("".startIndex)")	// position: 0
print("Empty end index: \("".endIndex)")		// position: 0

let str = "ABC"
print("\(str) start index: \(str.startIndex)")	// position: 0
print("\(str) end index: \(str.endIndex)")		// position: 3

str[str.endIndex]		// fatal error
```

1. Empty String 的 startIndex 與 endIndex 會相同，position 都為 0

使用方法：

```swift
let greeting = "Guten Tag!"

print(greeting[greeting.startIndex])								// G
print(greeting[greeting.index(before: greeting.endIndex)])			// !
print(greeting[greeting.index(after: greeting.startIndex)])			// u
print(greeting[greeting.index(greeting.startIndex, offsetBy: 7)])	// a
```

### Inserting and Removing

```swift
var welcome = "hello"

welcome.insert("!", at: welcome.endIndex)
print(welcome)	// hello!

welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))
print(welcome)	// hello there!

let range1 = welcome.index(welcome.startIndex, offsetBy: 2)..<welcome.index(welcome.endIndex, offsetBy: -1)
print(welcome.substring(with: range1))	// llo there

welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)	// hello there

let range2 = welcome.index(welcome.endIndex, offsetBy: -6)...welcome.index(before: welcome.endIndex)
welcome.removeSubrange(range2)
print(welcome)	// hello
```

1. `substring` 不能使用 `ClosedRange` 也就是 `...` 產生的 `Range`


## Comparing Strings

直接使用 `==` or `!=` 來比較是否相同。eg: 

```swift
let a = "abc"
let b = "abc"

print(a == b ? "same" : "Not the same")	// true
```

### Extended Grapheme Clusters Comparing

```swift
let cafe1 = "caf\u{E9}"
print(cafe1)

let cafe2 = "caf\u{65}\u{301}"
print(cafe2)

print(cafe1 == cafe2 ? "yes": "no")	// yes
```

## Unicode Representation

* UTF-8: **8bit** value with `UInt8`
* UTF-16: **16bit** value with `UInt16`
* UnicodeScalar: **21bit** value with `UInt32`

```swift
let dog = "Dog‼🐶"

print("\(dog) has \(dog.characters.count) character(s)")

print("utf-8 view")
for c in dog.utf8 {
    print("\(c)", terminator: " ")
}
print()

print("utf-16 view")
for c in dog.utf16 {
    print("\(c)", terminator: " ")
}
print()

print("unicode scalar view")
for u in dog.unicodeScalars {
    print("(\(u),\(u.value))", terminator: " ")
}
print()
```