# Swift Language Guide - Functions

重點：

* Swift 是 First Class 語言，也就是說在 Swift 中，Function 也是一種資料型別，可以當作參數，也可以當 return 值。
* Swift 宣告 Function 沒有 return 值時，其實是 compile 成 return `Void` 的型別。`Void` 是一種空的 Tuple `()`. 
* Swift Function 的 Parameter 是 Constant

## 宣告

* 有 return 值

	```swift
	func FUNCTION_NAME(PARAMETER_NAME: DATA_TYPE, PARAMETER_NAME: DATA_TYPE) -> DATA_TYPE {
	}
	```
	
	eg:
	
	```swift
	func greeting(person: String) -> String {
	    return "Hello, \(person)!"
	}
	
	print(greeting(person: "Anna"))
	```

* 沒有 return 值

	```swift
	func FUNCTION_NAME(PARAMETER_NAME: DATA_TYPE, PARAMETER_NAME: DATA_TYPE) {
	}
	```

	eg:
	
	```swift
	func greeting2(person: String) {
	    print("Hello, \(person)!")
	}
	
	greeting2(person: "Anna")
	```

* 想省略 argument label 時，宣告時，在 PARAMETER_NAME 前，加 `_` 符號。

	```swift
	func FUNCTION_NAME(_ PARAMETER_NAME: DATA_TYPE, PARAMETER_NAME: DATA_TYPE) -> DATA_TYPE {
	}
	
	func FUNCTION_NAME(_ PARAMETER_NAME: DATA_TYPE, PARAMETER_NAME: DATA_TYPE) {
	}
	```
	
	eg:

	```swift
	func greeting(_ person: String) -> String {
	    return "Hello, \(person)!"
	}
	
	print(greeting("Anna"))
	```
	


## Argument Label 與 Overloaded Function

在 Swift 使用 argument label 時，即使參數的資料型別相同，還是可以使用。

eg:

```swift
func total(price: Int, number: Int) -> Int {
    return price * number
}

func total(size: Int, number: Int) -> Int {
    return size * number * 2
}

func total(_ amount: Int, _ number: Int) -> Int {
    return amount * number * 3
}

print(total(price: 10, number: 20))	// 200
print(total(size: 10, number: 20))	// 400
print(total(10, 20))					// 600
```

## 參數預設值
有預設值的參數，要放在最後

eg:

```swift
func join(_ value1: String, _ value2: String, _ joiner: String = " ") -> String {
    return "\(value1)\(joiner)\(value2)"
}

print(join("a", "b"))
print(join("a", "b", ","))
```

## VARIADIC Paramenter and Return Multiple Result

### VARIADIC Paramenter
* 指參數的數量不固定時，可以不傳，也可以有多個。
* 在 Function 內，此參數會當作 Array 處理

### Return Tuple
Function 想回傳多組資料時，可以使用 Tuple. Swift Tuple 設計的很好，可以多加利用


eg:

```swift
func arithmetic(_ numbers: Double...) -> (min: Double, max: Double, mean: Double)? {
	if numbers.count <= 0 {
	    return nil
	}
    
	var min = numbers[0], max = numbers[0], total = 0.0
    
	for number in numbers {
		if min > number {
		    min = number
		}
		    
		if max < number {
		    max = number
		}
		    
		total += number
	}
    
	return (min, max, total / Double(numbers.count))
}

let test1 = arithmetic()

if let result = test1 {
	print("test1 max:\(result.max), min:\(result.min), mean:\(result.mean)")
}

let test2 = arithmetic(1, 2, 3, 4, 5)
if let result = test2 {
	print("test2 max:\(result.max), min:\(result.min), mean:\(result.mean)")
}
```



## Parameter Passing

### Constants

Swift Function 的 Parameter 是 **Constant**，因此在 Function 不能更動值, 如果要更新值，則需要重新宣告一個新變數。

eg:

```swift
func abc(a: Int, b: Int) -> Int {
    a += a	// compile error

    return a + b
}

print(abc(a: 10, b: 20))
```

fix: 

```swift
func abc(a: Int, b: Int) -> Int {
    let c = a + a

    return c + b
}

print(abc(a: 10, b: 20))
```

### In-Out

* In-Out 可以修改傳入的參數值，使用 `&` 來傳參數。
* Constant (`let`) 的變數，不能當 in-out 參數
* In-Out 不可用在 __VARIADIC__ 參數

eg:

```swift
func swap(a: inout Int, b: inout Int) {
    (a, b) = (b, a)
}

var a = 10, b = 20

print("a=\(a), b=\(b)")
swap(&a, &b)
print("a=\(a), b=\(b)")

let c = 30, d = 40
print("c=\(c), d=\(d)")
swap(&c, &d)	// compile error
print("a=\(c), b=\(d)")

swap(20, &d)	// compile error

func abc(a: inout Int...) {	// compile error
    
}
```

## Function Type

Swift 是 First Class 語言，也就是說在 Swift 中，Function 也是一種資料型別，可以當作參數，也可以當 return 值。

```swift
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// 將 Function 當作資料型別，宣告變數
let anFunc: (Int, Int) -> Int = add

print(anFunc(10, 20))

// Function 當作參數傳入
func opNumber(op: (Int, Int) -> Int, _ a: Int, _ b: Int) -> Int {
    return op(a, b)
}

print(opNumber(op: add, 10, 20))
print(opNumber(op: multiply, 10, 20))

// Function 當作回傳值
func chooseOp(addNumber: Bool) -> (Int, Int) -> Int {
    return addNumber ? add : multiply
}

print(chooseOp(addNumber: true)(10, 20))
print(chooseOp(addNumber: false)(10, 20))
```

## Nested Function

```swift
func chooseOp(addNumber: Bool) -> (Int, Int) -> Int {
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

    return addNumber ? add : multiply
}

print(chooseOp(addNumber: true)(10, 20))
print(chooseOp(addNumber: false)(10, 20))
```
