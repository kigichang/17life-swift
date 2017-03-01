# Swift Language Guide - Basic Operators

Swift 的運算與 C, Java 等，大部份都相同，以下僅撰寫新增、不同、及要注意的重點。


## Assignment

* Assignment __NOT__ return a value

	```swift
	if x = y { <-- Error
	}
	```

* Assignment with Tuple and Swap

	```swift
	var (x, y) = (1, 2)
	print("(x, y) = (\(x), \(y))")

	(x, y) = (y, x)
	print("(x, y) = (\(x), \(y))")
	```

## Remainder


a = (b X some multiplier) + remainder

```swift
print(8 % 3)
print(-9 % 2)
print(-9 % -2)
```

## Comparison

比較 Tuple，會先從第一個元素開始比對。

```swift
print((1, "zebra") < (2, "apple"))	// true
print((3, "apple") >= (3, "bird"))	// false
print((4, "dog") == (4, "dog"))		// true
```

## Ternary

```swift
question ? answer1 : answer2
```

## Nil-Calescing

用在 Optional 上，用在取值，如果是 `nil` 時，則給預設值。

```swift
a ?? b
```

equals

```swift
a != nil ? a! : b
```

eg:

```swift
let possibleNumber = "123"

let test = 123 + (Int(possibleNumber) ?? 0)

print(test)
```

以上的 sample code, `Int(possibleNumber) ?? 0` 等同於 `(Int(possibleNumber) != nil ? (Int(possibleNumber))! : 0)`。  
如果 `possibleNumber` 改成 `"abc"`，則會用 `0` 當預設值。


## Range

* Closed Range ( a <= x <= b )

	```swift
	for i in 0...5 {
	    print(i)		// print 0 ~ 5
	}
	```

* Half-Closed Range (( a <= x < b )

	```swift
	for i in 0..<5 {
	    print(i)		// print 0 ~ 4
	}
	```
