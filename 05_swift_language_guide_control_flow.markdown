# Swift Language Guide - Control Flow

介紹 Swift

* [for in](#for)
* [while, repeat while](#while)
* [if](#if)
* [switch-case](#switch)
* [continue](#continue), [break](#break), [fallthrough](#fallthrough), [label](#label), [return](#return)

等語法與需要注意的事項

## <a name="for"></a>for-in Loop

* 基本用法

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
```

* 不需要 index，可用萬用字元(`_`)

```swift
let base = 3
let power = 2
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")
```

* 訪問 Array or Set

```swift
let names1 = ["Anna", "Alex", "Brian", "Jack"]

let names2: Set<String> = ["Anna", "Alex", "Brian", "Jack"]

for name in names1 {
    print(name)
}

for name in names2 {
    print(name)
}
```

* 訪問 Dictionary

```swift
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
```

## <a name="while"></a>while loop

### while and repeat-while

```swift
let count = 2
var index = 2

while index < count {
    print(index)
    index += 1
}

index = 2
repeat {
    print(index)
    index += 1
} while index < count
```


## <a name="if"></a>if

一定要是 `Bool` 才行，不能像 C 一樣用數字。

```swift
let a = 1

if a == 1 {
    print(a)
}

if a {		// Compile Error
    print(a)
}
```

* with Optional Type

```swift
var optionalString: String? = "It is an optional string"

if let value = optionalString {
    print(value)
}
```

## <a name="switch"></a>switch-case
Swift 的 `switch` 與原本 C 的用法差很多。

* Swift 的 `case` 一定要有程式碼 (body), C 不用。
* C 要用 `break` 來跳出 `switch`，但 Swift 不用，`case` 的程式區塊執行完，則跳出 `switch`。
* C 如果不要跳出 `switch`，可不用 `break`，但 Swift 需要用 `fallthrough`
* Swift 的 `case` 條件，不限於數字，可以是 String，甚至可下判斷式 (`where`)
* Swift 的 switch-case 一定要包含到所有的可能條件，如果無法包含到所有可能的條件時，一定要用 `default`，否則會編譯失敗。

### 基本用法

```swift
let countryCode = "TW"

switch countryCode {

case "TW":
    print("it is ghost island")
    
case "US":
    print("it is race country")
    
default:		// 一定要放 default
    print("others")
    
}
```

### `case` 要有程式區塊

```swift
let c = 20

switch c {
case 1:		// Compile Error

case 20:
    print("20")
    
default:
    print("other")
}
```

### `case` 可以多種條件並存

```swift
let countryCode = "tw"

switch countryCode {
    
case "TW", "tw":		// 大、小寫的條件
    print("it is ghost island")
    
case "US", "us":
    print("it is race country")
    
default:
    print("others")
    
}
```

### `case` 可以用 `range`

```swift
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
```

### Tuple and Binding Value
* 在 `case` 可用萬用字元(`_`)，來判斷 tuple 格式。
* 在 `case` 可用 `let` 取值。

```swift
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
```

### `where` in `case`
在 `case` 可 `where` 來做比較複雜的判斷。

```swift
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")

case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")

case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
```

## Control Transfer Statements

以下會簡介：

* continue
* break
* fallthrough
* return

其中 `continue` 與 `break` 與大多數的程式言相同。

### <a name="continue"></a>Continue

```swift
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
```


### <a name="break"></a>BREAK

* in for-loop

```swift
for index in 1...10 {
    print(index)
    if (index == 5) {
        break
    }
    
}
print("end")
```

* in switch-case

```swift
let c = 20

switch c {
case 1:
    break
case 20:
    println("20")
default:
    break
}
```

### <a name="fallthrough"></a>FALLTHROUTH

Swift 在 switch-case 與 C, Java 最大不同是不用下 `break` 就會離開 `switch` 的區塊，如果要執行下一個 `case` 的程式區塊，則需要用 `fallthrough`.


code 1: 

```swift
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
```

code 2:

```swift
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
```

限制：  
因為 `fallthrough` 不會去執行下一個 `case` 的判斷式，因此如果下一個 `case` 有取值的行為 (`let`)，則會編譯錯誤，如下：

```swift
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
```

### <a name="label"></a>Label Statement

* 與 C, Java 類似，在程式碼用 label，但 Swift 只能用在 if, for, while.
	* Conditional statement label (if)
	* Loop statement label (while, for)
* `continue` 只能回到 loop statement label (`while`, `for`)，否則會編譯失敗


```swift
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
```

### <a name="return"></a>Early Exit

程式中，可以使用 `return` 提早結束程式的執行。

```swift
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
```

ps: Swift 提 `guard`，與 `if` 類似，`if` 不一定要撘 `else`，但 `guard` 一定要有 `else`
