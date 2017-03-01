//for char in "Dog!🐶".characters {
//    print(char)
//}

//let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
//let catString = String(catCharacters)
//print(catString)

//let dollarSign = "\u{24}"
//print(dollarSign)

//let blackHeart = "\u{2665}"
//print(blackHeart)

//let sparklingHeart = "\u{1F496}"
//print(sparklingHeart)


//let eAcute: Character = "\u{E9}"
//print(eAcute)

//let e = "\u{65}"
//print(e)
//let t = "\u{301}"
//print(t)

//let combine: Character = "\u{65}\u{301}"
//print(combine)

//print(eAcute == combine)

//let precomposed: Character = "\u{D55C}"
//print(precomposed)


//let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
//print(decomposed)

//let U: Character = "\u{1F1FA}"
//print(U)

//let S: Character = "\u{1F1F8}"
//print(S)

//let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
//print(regionalIndicatorForUS)


//let penguin = "Penguin 🐧"
//print("\(penguin) has \(penguin.characters.count) characters")

//let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
//print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

//var word = "cafe"
//print("\(word) has \(word.characters.count)")

//word += "\u{301}"
//print("\(word) has \(word.characters.count)")

//print("Empty start index: \("".startIndex)")    // position: 0
//print("Empty end index: \("".endIndex)")        // position: 0

//let str = "ABC"
//print("\(str) start index: \(str.startIndex)")  // position: 0
//print("\(str) end index: \(str.endIndex)")      // position: 3

//str[str.endIndex]       // fatal error

//let greeting = "Guten Tag!"

//print(greeting[greeting.startIndex])                                // G
//print(greeting[greeting.index(before: greeting.endIndex)])          // !
//print(greeting[greeting.index(after: greeting.startIndex)])         // u
//print(greeting[greeting.index(greeting.startIndex, offsetBy: 7)])   // a


var welcome = "hello"

welcome.insert("!", at: welcome.endIndex)
print(welcome)  // hello!

welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))
print(welcome)  // hello there!

//let range1 = welcome.index(welcome.startIndex, offsetBy: 2)..<welcome.index(welcome.endIndex, offsetBy: -1)
//print(range1)
//print(welcome.removeSubrange(range1))  // llo there
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)  // hello there

//let range2 = welcome.index(welcome.endIndex, offsetBy: -6)...welcome.index(before: welcome.endIndex)
//welcome.removeSubrange(range2)
//print(welcome)  // hello


let a = "abc"
let b = "abc"

print(a == b ? "same" : "Not the same")	// true


let cafe1 = "caf\u{E9}"
print(cafe1)

let cafe2 = "caf\u{65}\u{301}"
print(cafe2)

print(cafe1 == cafe2 ? "yes": "no") // yes


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
