# Swift Language Guide - Collection

* Array: **Ordered** collections of values.
* Set: **UnOrdered** collections of **Unique** values.
* Dictionary: **UnOrdered** collections of **Key-Value** associations.

**Immutable** (`let`, assign collection as **Constant**) collection **cannot be** changed its size and content.

```swift
let constantArray: [Int] = [1, 2, 3]

constantArray[0] = 10   // Compile Error
```

## Array

`Array` is bridged to `NSArray`

### Initialize

* Declaration and Empty Array

```swift
var someInts1 = [Int]()

var someInts2:[Int] = []

var someInts3: Array<Int> = []
```

* Declaration with Default Values

```swift
var treeDoubles1 = Array(repeating: 0.0, count: 3)
print(treeDoubles1)

var treeDoubles2 = [Double](repeating: 10.0, count: 3)
print(treeDoubles2)

var shoppingList1: [String] = ["Eggs", "Milk"]
print(shoppingList1)

var shoppingList2 = ["Eggs", "Milk"]		// short term
print(shoppingList2)

if shoppingList2.isEmpty {
    print("An empty list")
}
else {
    print("The shopping list contains \(shoppingList2.count) items")
}

shoppingList2 = []	// empty an Array

if shoppingList2.isEmpty {
    print("An empty list")
}
else {
    print("The shopping list contains \(shoppingList2.count) items")
}
```

### Iterate

* `.enumerated()` to get integer index for each item

```swift
var shoppingList = ["Eggs", "Milk"]

for item in shoppingList {
    print(item)
}

for (index, item) in shoppingList.enumerated() {
    print("\(index): \(item)")
}
```

### Append

* `.count` to get array size
* `.append(item)` to add **One** item
* `+=` to append an array contains one or more items

```swift
var shoppingList = ["Eggs", "Milk"]

print("The shopping list contains \(shoppingList.count) items")    // get array size

shoppingList.append("Flour")        // add one item
dump(shoppingList)

shoppingList += ["Baking Powder"]   // append an array with one item
dump(shoppingList)

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]    // append an array with more than one items
dump(shoppingList)
```

### Insert and Replace

* `[]` to access item
* `[Range] to replace items
* `.insert(item, at:)` to insert item
* `.remove(at:)` to remove item

```swift
var firstItem = shoppingList[0]

shoppingList[0] = "Six Eggs"    // replace first item
dump(shoppingList)

shoppingList[2...3] = ["Bananas", "Apples"]     // replace Flour, Baking Powder with Bananas, Apples
dump(shoppingList)

shoppingList[2..<4] = ["Bananas", "Apples"]     // the same as [2...3]
dump(shoppingList)

shoppingList[2...4] = ["Bananas", "Apples"]     // replace Flour, Baking Powder with Bananas, Apples and remove Chocolate Spread
dump(shoppingList)

shoppingList.insert("Mapple Syrup", at: 0)      // first item is Mapple Syrup
dump(shoppingList)

let mappleSyrup = shoppingList.remove(at: 0)
//let mappleSyrup = shoppingList.remove(at: shoppingList.startIndex)	// the same as .remove(at: 0)
dump(shoppingList)


let butter = shoppingList.removeLast()
//let butter = shoppingList.remove(at: shoppingList.index(before: shoppingList.endIndex))		// the same as .removeLast()
dump(shoppingList)
```

## Set

* Element in Set **Must** be **Hashable**.
* Hashable is providing a way to compute a *hash value* (`.hashValue`) for itself.
* All of Swift's basic types (such as **String**, **Int**, **Double**, and **Bool**) are hashable.

### Initialize

```swift
var letter1 = Set<Character>()
var letter2: Set<Character> = []
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
```

### Count, isEmpty, Iterate

```swift
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
}
else {
    print("I have particular music preferences")
}

print("dump set item")
for genre in favoriteGenres {
    print(genre)
}

print("dump set item with inc")
for genre in favoriteGenres.sorted() {
    print(genre)
}

print("dump set item with desc")
for genre in favoriteGenres.sorted(by: {(a, b) in return a.hashValue < b.hashValue}) {
    print(genre)
}

print("dump set item with index")
for (index, genre) in favoriteGenres.enumerated() {
    print("(\(index), \(genre))", terminator: ",")
}

for (index, genre) in favoriteGenres.sorted().enumerated() {
    print("(\(index), \(genre))", terminator: " ")
}
```

### Insert, Remove, Contains

```swift
// summary dump function
func dump<T: Collection>(_ seq: EnumeratedSequence<T>) {
    for (index, item) in seq {
        print("(\(index), \(item))", terminator: " ")
    }
}

func dump<T: Hashable>(_ set: Set<T>, sorted: Bool = false, order: (T, T) -> Bool = { (a, b) in return a.hashValue > b.hashValue }) {

    if sorted {
        dump(set.sorted(by: order).enumerated())
    }
    else {
        dump(set.enumerated())
    }
    print()
}

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
dump(favoriteGenres)

favoriteGenres.insert("Jazz")
dump(favoriteGenres)

let rock = favoriteGenres.remove("Rock")
dump(favoriteGenres)

if let metal = favoriteGenres.remove("Heavy Metal") {
    print("\(metal) removed")
}
else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
}
else {
    print("It's too funky in here.")
}
```

### Set Operations

#### Union
![Union](https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Venn0111.svg/220px-Venn0111.svg.png)

#### Intersection
![Intersection](https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Venn0001.svg/220px-Venn0001.svg.png)

#### Relative Complement (Subtract)
![Relative Complement](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Venn0100.svg/220px-Venn0100.svg.png)

#### Symmetric Difference
![Symmetric Difference](https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Venn0110.svg/220px-Venn0110.svg.png)

```swift
let odd: Set = [1, 3, 5, 7, 9]
let even: Set = [2, 4, 6, 8]
let prime: Set = [2, 3, 5, 7]

print(odd.union(even).sorted())					// [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(odd.intersection(even).sorted())			// []
print(odd.subtracting(prime).sorted())			// [1, 9]
print(odd.symmetricDifference(prime).sorted())	// [1, 2, 9]
```

### Membership & Equality

![Membership & Equality](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Venn_A_subset_B.svg/150px-Venn_A_subset_B.svg.png)

Odd, Even, Prime declaration

```swift
let odd: Set = [1, 3, 5, 7, 9]
let even: Set = [2, 4, 6, 8]
let prime: Set = [2, 3, 5, 7]
let all = odd.union(even)
```

* `.isSubset`: every one in A is in B => A is subset of B

```swift
print(odd.isSubset(of: all))        // true
print(even.isSubset(of: all))       // true
print(prime.isSubset(of: all))      // true
print(all.isSubset(of: all))        // true
print(prime.isSubset(of: odd))      // false
print()
```

* `.isSuperset`: every one in A is in B => B is superset of A

```swift
print(all.isSuperset(of: odd))      // true
print(all.isSuperset(of: even))     // true
print(all.isSuperset(of: prime))    // true
print(all.isSuperset(of: all))      // true
print(odd.isSuperset(of: prime))    // false
print()
```
* `.isStrictSubset`: A is **subset** of B and A is **not equal** to B => A is strict subset of B

```swift
print(odd.isStrictSubset(of: all))      // true
print(even.isStrictSubset(of: all))     // true
print(prime.isStrictSubset(of: all))    // true
print(all.isStrictSubset(of: all))      // false
print()
```

* `.isStrictSuperset`: B is **superset** of A and B is **not equal** to A => B is strict superset of A

```swift
print(all.isStrictSuperset(of: odd))    // true
print(all.isStrictSuperset(of: even))   // true
print(all.isStrictSuperset(of: prime))  // true
print(all.isStrictSuperset(of: all))    // false
print()
```

* `.isDisjoint`: every one in A **is not** in B => A is disjoint B

```swift
print(odd.isDisjoint(with: even))       // true
print(prime.isDisjoint(with: odd))      // false
print(prime.isDisjoint(with: even))     // false
```

## Dictionary

* Key-Value and unordered structure
* `Dictionary` is bridged to `NSDictionary`
* Key must confirm `Hashable` protocal like `Set`


### Initialize

```swift
var empty1: Dictionary<String, Int> = [:]
var empty2: [String: Int] = [:]
var empty3 = [String: Int]()

var defaults: [String: Int] = ["a": 1, "b": 2, "c": 3]

var notOK: [AnyHashable: Any] = ["a": 1, 2: "B", "c": 3.0]	// compile ok, but very very bad
```

### Operations

#### Count, isEmpty, Iterate

```swift
var airports: [String: String] = ["XYZ": "Toronto Pearson", "DUB": "Dublin"]
dump(airports)

print("The airports dictionary contains \(airports.count) items")

if airports.isEmpty {
    print("The airports dictionary is empty.")
}
else {
    print("The airports dictionary contains \(airports.count) items")
}
```

#### Read, Write, Remove

```swift
var a = airports["XYZ"]		// a is an Optional Type
a?.append("XYZ")
print(a)		// Optional("Toronto PearsonXYZ")

var b = airports["ABC"]
b?.append("ABC")
print(b)		// nil

airports["LHR"] = "London"		// update value

var c = airports.updateValue("London", forKey: "LHR")	// update value and get old value, c is an Optional Type
print(c)

dump(airports)
airports["XYZ"] = nil	// remove value with assigning nil
dump(airports)
let d = airports.removeValue(forKey: "ABC")	// remove value and get it. d is an Optional value
print(d)
```

* `updateValue(, forKey:)` return **Optional Value**
* `removeValue(forKey:)` return **Optional Value**
