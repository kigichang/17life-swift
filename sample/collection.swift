// Array
let constantArray: [Int] = [1, 2, 3]
//constantArray[0] = 10       // Compile Error
//constantArray.append(100)   // Compile Error

var someInts1 = [Int]()
var someInts2: [Int] = []
var someInts3: Array<Int> = []

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


var shoppingList = ["Eggs", "Milk"]

for item in shoppingList {
    print(item)
}

for (index, item) in shoppingList.enumerated() {
    print("\(index): \(item)")
}

func dumpArray<T>(_ array: [T]) {
    for (index, element) in array.enumerated() {
        print("(\(index), \(element))", terminator: " ")
    }
    print()
}


print("The shopping list contains \(shoppingList.count) items")    // get array size

shoppingList.append("Flour")        // add one item
dumpArray(shoppingList)

shoppingList += ["Baking Powder"]   // append an array with one item
dumpArray(shoppingList)

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]    // append an array with more than one items
dumpArray(shoppingList)
