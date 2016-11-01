# Swift Language Guide - The Basics

## 前言

* Swift 是一種 type-safe 語言，因此變數的型別決定後，就不能再更改。
* Swift 提供 Objective-C 沒有的型別: **Tuple**。
* Swift 提供 Optional 的功能，類似 `nil` 但可以用在任何一種資料型別上。


## Constants and Variables

```swift
let a = 10 // constant，之後不能再修改值
var b = 20 // variables, 之後可再修改值
```

**如果變數宣告後，不會再修改，請改用 `let` 來宣告成 constant 變數**

在一行內，宣告多個變數，eg:

```swift
var a =  10, b = 1.0, c = "abc" // 在一行內，宣告多個變數
	
print("\(a), \(b), \(c)")	// String interpolation 功能
```

Swift 的變數名稱可以使用 Unicode，但不建議使用。

## String interpolation

類似 C 語言中 `print("%d, %s", 10, "test")` 的效果。

```swift
var a =  10, b = 1.0, c = "abc"

var str = "\(a), \(b), \(c)"

print(str)
```

## Type Annotation

在宣告變數時，可以用 `:` 加上資料型別來標示此變數是那種資料型別。eg: `let a: Int = 10`。

一般如果不標示資料型別時，

* 值是整數值，則為 `Int`. eg: `let a = 10`，則 `a` 的資料型別為 `Int`
* 值是浮點數，則為 `Double`。eg: `let pi = 3.1415`，則 `pi` 的資料型別為 `Double`

## Multiple Statements in a Line

Use semicolon `;`

```swift
let a = 10; print(a)
```

## 資料型別 (Data Type)

Swift 有提供 Integer, Floating Point, Boolean, String 等資料型別。

### Integer

Swift Integer 有分 **singed** 與 **unsigned**；且跟作業系統是 **32** or **64** Bit 有關。Integer 的長度有：8, 16, 32, 64 bit.

最常用的 `Int` or `UInt`

* Int on 32-bit platform is Int32
* UInt on 32-bit platform is UInt32
* Int on 64-bit platform is Int64
* UInt on 64-bit platform is UInt64

變數宣告時，沒有指定型別，且值為整數時，則預設該變數的型別為 `Int`. eg:

```swift
let a = 10 // a 的型別為 Int
let b = UInt8.min // b 的型別為 UInt，且值為 0
```

**宣告方式:**

```swift
let decimalInt = 17				// 十進位
let binaryInt = 0b10001			// 二進位
let octalInt = 0o21				// 八進位
let hexInt = 0x11				// 十六進位

printlprintn(decimalInt)
print(binaryInt)
print(octalInt)
print(hexInt)

let oneMillion = 1_000_000		// 千位數隔開，提高可讀性
print(oneMillion)
```


### Floating-Point
和其他的程式語言相同，分為：`Float` 及 `Double`。

變數宣告時，沒有指定型別，且值為浮點數時，則此變數的資料型別為 `Double`. eg:

```swift
let pi = 3.1415 // pi 的型別為 Double
```

**宣告方式:**

* `e` for 十進位 10^exp, eg: `1.25e2 = 1.25 * 10^2 = 125.0`
* `p` for 十六進位 2^exp, eg: `0xFp2 = 15 * 2^2 = 60.0`

```swift
let justOverOneMillion = 1_000_000.000_000_1	// 千位數隔開，提高可讀性
print(justOverOneMillion)

let a = 1.25e2	// 1.25 * 10^2 = 125.0
let b = 1.25e-2	// 1.25 * 10^-2 = 0.0125

print(a)
print(b)

let c = 0xFp2	 	// 15 * 2^2 = 60.0
let d = 0xFp-2 		// 15 * 2^-2 = 3.75

print(c)
print(d)

let e = 0xC.3p0	// C * 16^0 + 3 * 16^-1 = 12 + 3/16 = 12.1875 
print(e)
```


### 數值轉換

* 即使是 Integer 的型別，Int16 與 Int32 做運算是，也一樣要轉成同類型的型別。eg:

	```swift
	let a: Int16 = 10
	let b: Int8  = 2
	let c = a + b		// Compile Error
	let c = a + Int16(b)
	print(c)
	```

* 浮點數轉成整數時，**不會**做四捨五入，而是**直接將小數點的部分去除**

	```swift
	let pi = 3.1415
	let c = 3.6
	
	print(Int(pi))	// 3
	print(Int(c))	// 3
	```

### Type Aliases

Swift 可以將原有的資料型別，定義新的別名。eg:

```swift
typealias MyInt = Int64		// 定義一種新的資料型別，本質是 Int64
print(MyInt.max)		// 9223372036854775807
```

此功能通常是用來提高程式的可讀性。eg: 

```swift
typealias XYPoint = (x: Double, y: Double)

let p: XYPoint = (1.0, 2.0)

print(p.x)
print(p.y)

```

### 布林值 (Bool)

值為 `true` or `false`；且不能與數值直接轉換，因此不能像 C 語言

```c
int a = 10;
if (a) {
}
else {
}
```

Bool 與數值間的轉換

```swift
print(Bool(-1)) 	// true
print(Bool(0))      // false
print(Bool(1))      // true

let a = 1

if a {	
}	// Compile Error


if a == 1 {
}	// Compile OK

```

p.s. 原舊版的 `Boolean` 取消了。


### Tuples

Tuples 是將多個變數組合起來，當作一個資料型別來使用。沒有支援 Tuple 的程式語言，當要回傳多組值時，則需要將這些變數值，組合成 `struct` or `class`，有 Tuple 設計時，則可簡化這方面的程式碼。

Tuple 用法：

```swift
let p = (1.0, 2.0)	// 將兩組 Double 變數，組成一個 Tuple

print(p.0)	// 取第一個值。
print(p.1)	// 取第二個值。

let (x, y) = p	// 分解 tuple

print(x)
print(y)
```

Swift 的 Tuple 有個強大的功能，可以對每個組成的成員，給予變數名稱，如此就好像在使用 `struct` or `class`。

```swift
let p1: (x: Double, y: Double) = (1.0, 2.0)	// 給予變數名稱 x, y
print(p1.x)
print(p1.y)


let p2 = (x: 3.0, y: 4.0, z: 5.0)		// 給予變數名稱 x, y
print(p2.x)
print(p2.y)
print(p2.z)
```

如果再配合 `typealias`，可以讓設計更彈性，也更具可讀性。

```swift
typealias XYZPoint = (x: Double, y: Double, z: Double)

let origin: XYZPoint = (0.0, 0.0, 0.0)
var p: XYZPoint = (0.0, 1.0, 2.0)

p.x = 5.0

print(p.x)
print(p.y)
print(p.z)

func distance(p1: XYZPoint, p2: XYZPoint) -> Double {

    return sqrt(
        (p1.x - p2.x) * (p1.x - p2.x) +
        (p1.y - p2.y) * (p1.y - p2.y) +
        (p1.z - p2.z) * (p1.z - p2.z) )
}

let d = distance(p1: origin, p2: p)

print(d)
```


## Optional
Optional 的設計主要是用來避免寫程式最大的惡夢：**NullPointException**。一個變數為 Optional 在程式上有兩種可能：

1. 有實際值存在，可以透過內建函式或運算取到實際的值。
2. 不存在值，為 `nil`

因此在程式設計時，多使用此機制來回傳值，不要直接回傳 `nil`，來提供程式的穩定度。  
當有函式回傳 Optional 時，也應該利用 Optional 檢查的方式，來確認是否有正確值存在。

### 宣告方式 ###

```swift
var a: Int? = 10		// 宣告方式：資料型別 + ?
print(a)				// Optional(10)

a = nil					// 可以 assign nil
print(a)				// nil
```

### If statement and Forced Unwrapping

利用 `if` 來判斷是否有值。

```swift
let possibleNumber = "123"
let convertNumber = Int(possibleNumber)		// 會回傳 Int?

if convertNumber != nil {
    print("\(possibleNumber) is a number \(convertNumber)")
}
else {
    print("\(possibleNumber) is NOT a number")
}
```

以上的 sample code，`convertNumber` 的型別為 `Int?`，因為有值 (`123`) ，所以在 `if` 判斷上不是 `nil`。`convertNumber`的型別是 `Int?` 並還未取得真正的 `Int` 值，如果此時做運算時，會 compile error. eg:

```swift
let test = convertNumber + 1234	// Compile Error
```

要修正上面的錯誤，可以用 `!` 來取 Optional 型別的值。eg:

```swift
let test = convertNumber! + 1234	// Compile OK
print(test)		// 1357
```

雖然可以用 `!` 取值，但不建議使用。因為 Optional 的型別，不確定是有值還是為 `nil`。當 Optional 是 `nil` 時，使用 `!` 取值，會在 runtime 時期發生 fatal error. eg:

```swift
let possibleNumber = "abc"
let convertNumber = Int(possibleNumber)

if convertNumber != nil {
    print("\(possibleNumber) is a number \(convertNumber)")
}
else {
    print("\(possibleNumber) is NOT a number")
}

let test = convertNumber! + 1234	// fatal error

print(test)
```

Optional 常用的方式，如果有值，則取值，如果是 `nil` 則給一個預設值。可以使用 Swift 的 `??` 方式。

```swift
let possibleNumber = "123"

let test = 123 + (Int(possibleNumber) ?? 0)

print(test)
```

**Optional Binding**

在 `if` 的判斷式中，取值，如果為 `nil` 時，不會發生 fatal error. eg:

```swift
let possibleNumber = "123"

if let convertNumber = Int(possibleNumber) {
    print("\(possibleNumber) is a number \(convertNumber)")
    let test = convertNumber + 1234
    print(test)
}
else {
    print("\(possibleNumber) is NOT a number")
}
```

以上的 sample code， `convertNumber` 的型別為 `Int`，因此可以做運算。如果將 `possibleNumber` 改值為 `"abc"`，以上的 sample code 不會發生 fatal error。

**Implicitly Unwrapped Optionals**

如果確定 Optional 內一定都會有值，可以使用 **implicit** unwrap 的方式，直接使用值。eg:

```swift
let test: Int! = 123

if test != nil {			// 可以判斷是否為 nil
    print("not nil")
}

if test > 0 {				// 可以直接比較大小
    print("test > 0")
}

print(test)
print(test + 123)		// 可以直接做運算
```

原本使用 `?` 可改用 `!`，且可以直接做運算。

雖然 **implicit** 的方式很方便，但是前題是你已經非常確定每次都會有值，才可使用，否則一樣會發生 fatal error. 比如將上面的 `test` 改成 `let test: Int! = nil`，則在 `if test > 0` 會發生 fatal error.

**註: 寫程式時，任何 implicit 的方式都要特別小心，除非非常熟悉機制與帶來的影響，否則我會建議能不用就不用。**

## Assignment 差異

Swift 的 Assignment 有一個地方與 C or Java 不同。在 Java 可以使用 `a = b = 10` 的方式給值, 但 Swift 不行。eg:

```java
public class Test {

	public static void main(String[] args) {

        int a = 0;

        int b = a = 20;

        System.out.println(a);
        System.out.println(b);
	}
}
```

上面的 sample code, `a` 與 `b` 的值都會是 `20`，Java 的 Assignment 運算，會回傳指派的值。

```swift
var a = 10

var b = a = 20 // Compile Error

var b: Void = a = 20 // Compile OK
print(b)	// ()

var b: () = a = 20	// Compile OK
print(b)	// ()
```

在 Swift 上，直接 `b = a = 20` 會因為資料型別不同，而編譯失敗。Swift 的 Assignment 運算是回傳 `Void`，而不是指派的值。

這一點的差異，要特別注意。