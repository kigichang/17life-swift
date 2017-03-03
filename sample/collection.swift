// array
/*
var shoppingList = ["Eggs", "Milk"]
dump(shoppingList)

shoppingList.append("Flour")        // add one item
dump(shoppingList)

shoppingList += ["Baking Powder"]   // append an array with one item
dump(shoppingList)

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]    // append an array with more than one items
dump(shoppingList)

shoppingList[0] = "Six Eggs"
dump(shoppingList)

//shoppingList[2...3] = ["Bananas", "Apples"]
//dump(shoppingList)

shoppingList[2..<4] = ["Bananas", "Apples"]     // the same as [2...3]
dump(shoppingList)

shoppingList[2...4] = ["Bananas", "Apples"]     // replace Flour, Baking Powder with Bananas, Apples and remove Chocolate Spread
dump(shoppingList)

shoppingList.insert("Mapple Syrup", at: 0)      // first item is Mapple Syrup
dump(shoppingList)

let mappleSyrup = shoppingList.remove(at: 0)
//let mappleSyrup = shoppingList.remove(at: shoppingList.startIndex)    // the same as .remove(at: 0)
dump(shoppingList)


let butter = shoppingList.removeLast()
//let butter = shoppingList.remove(at: shoppingList.index(before: shoppingList.endIndex))       // the same as .removeLast()
dump(shoppingList)
*/
// Set
/*
var letter1 = Set<Character>()
var letter2: Set<Character> = []
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

dump(favoriteGenres)

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
*/
/*
let odd: Set = [1, 3, 5, 7, 9]
let even: Set = [2, 4, 6, 8]
let prime: Set = [2, 3, 5, 7]
let all = odd.union(even)

print(odd.isSubset(of: all))        // true
print(even.isSubset(of: all))       // true
print(prime.isSubset(of: all))      // true
print(all.isSubset(of: all))        // true
print(prime.isSubset(of: odd))      // false
print()

print(all.isSuperset(of: odd))      // true
print(all.isSuperset(of: even))     // true
print(all.isSuperset(of: prime))    // true
print(all.isSuperset(of: all))      // true
print(odd.isSuperset(of: prime))    // false
print()

print(odd.isStrictSubset(of: all))      // true
print(even.isStrictSubset(of: all))     // true
print(prime.isStrictSubset(of: all))    // true
print(all.isStrictSubset(of: all))      // false
print()

print(all.isStrictSuperset(of: odd))    // true
print(all.isStrictSuperset(of: even))   // true
print(all.isStrictSuperset(of: prime))  // true
print(all.isStrictSuperset(of: all))    // false
print()

print(odd.isDisjoint(with: even))       // true
print(prime.isDisjoint(with: odd))      // false
print(prime.isDisjoint(with: even))     // false
*/

var empty1: Dictionary<String, Int> = [:]
var empty2: [String: Int] = [:]
var empty3 = [String: Int]()

var defaults: [String: Int] = ["a": 1, "b": 2, "c": 3]

var notOK: [AnyHashable: Any] = ["a": 1, 2: "B", "c": 3.0]  // compile ok, but very very bad

dump(defaults)

var airports: [String: String] = ["XYZ": "Toronto Pearson", "DUB": "Dublin"]
dump(airports)

print("The airports dictionary contains \(airports.count) items")

if airports.isEmpty {
    print("The airports dictionary is empty.")
}
else {
    print("The airports dictionary contains \(airports.count) items")
}

var a = airports["XYZ"]     // a is an Optional Type
a?.append("XYZ")
print(a)        // Optional("Toronto PearsonXYZ")

var b = airports["ABC"]
b?.append("ABC")
print(b)        // nil

//airports["LHR"] = "London"      // update value

var c = airports.updateValue("London", forKey: "LHR")   // update value and get old value, c is an Optional Type
print(c)

dump(airports)
airports["XYZ"] = nil   // remove value with assigning nil
dump(airports)
let d = airports.removeValue(forKey: "ABC") // remove value and get it. d is an Optional value
print(d)
