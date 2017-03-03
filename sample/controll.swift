/*for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


let base = 3
let power = 2
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

let names1 = ["Anna", "Alex", "Brian", "Jack"]

let names2: Set<String> = ["Anna", "Alex", "Brian", "Jack"]

for name in names1 {
    print(name)
}

for name in names2 {
    print(name)
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animal, leg) in numberOfLegs {
    print("\(animal)s have \(leg) legs")
}

for (animal, _) in numberOfLegs {
    print("\(animal)")
}

for (_, leg) in numberOfLegs {
    print("\(leg)")
}


let count = 2
var index = 2

while index < count {
    print("a: \(index)")
    index += 1
}

index = 2
repeat {
    print("b: \(index)")
    index += 1
} while index < count
*/
/*
let countryCode = "TW"

switch countryCode {

case "TW":
    print("it is ghost island")

case "US":
    print("it is race country")

default:		// 一定要放 default
    print("others")

}
*/
/*
let countryCode = "tw"

switch countryCode {

case "TW", "tw":		// 大、小寫的條件
    print("it is ghost island")

case "US", "us":
    print("it is race country")

default:
    print("others")

}


let approximateCount = 62

var naturalCount = ""

switch approximateCount {
case 0:
    naturalCount = "no"

case 1..<5:
    naturalCount = "a few"

case 5..<12:
    naturalCount = "several"

case 12..<100:
    naturalCount = "dozens of"

case 100..<1000:
    naturalCount = "hundreds of"

default:
    naturalCount = "many"
}

print("There are \(naturalCount) moons orbiting Saturn")


let somePoint = (1, 1)

switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")

case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")

case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")

case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")

default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}


let anotherPoint = (2, 0)

switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")

case (0, let y):
    print("on the y-axis with a y value of \(y)")

case let (x, y):
    print("somewhere else at (\(x), \(y))")
}


let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")

case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")

case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
*/
/*
let puzzleInput = "great minds think alike"

var puzzleOutput = ""

for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
    puzzleOutput.append(",")	// "a", "e", "i", "o", "u", " " 這些字元，不會 append ","
}
print(puzzleOutput)

for index in 1...10 {
    print(index)
    if (index == 5) {
        break
    }

}
print("end")


let c = 20

switch c {
case 1:
    break
case 20:
    print("20")
default:
    break
}


let integerToDescribe = 5

var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)


let b = 10

switch b {
case 1...20:
    print("1 <= \(b) <= 20")		// match and println
    fallthrough

case 11...20:
    print("11 <= \(b) <= 20")		// println because of fallthrough

case 5...15:
    print("1 <= \(b) <= 15")		// NOT be applied because of implicit break in case 11...20

default:
    print("nothing")				// NOT be applied because of implicit break in case 11...20
}


let test = (1, 10)

switch test {
case (0...5, 1..<5):
    print("0 <= x <= 5 and 1<= y < 5")
    fallthrough		// Compile Error

case (0, let y):
    print("x is zero")

default:
    print(test)
}
*/


var a = 1

Test1: if a > 0 {

    print("in if")
    Test2: for index in 1...10 {
        print("\(index)th in loop \(a)")

        switch a {

        case let x where x > 7: // 當 a = 8 時，會離開 if，程式結束
            break Test1

        case let x where x > 5: // 當 a = 6 時，會重新回到 for-loop
            a += 2
            continue Test2

        case let x where x > 3:
            print("\(x) in switch")


        default:
            break

        }

        a += 1
    }

}
print("END!!!")


func greet(person:[String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location)")
}

greet(person: ["name": "John"])

greet(person: ["name": "Jane", "location": "Cupertino"])
