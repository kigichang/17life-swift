// Constants and Variable
//let constant = 10
//var variable = 20

// String interpolation
//var a = 10, b = 1.0, c = "abc"
//print("\(a), \(b), \(c)")

// Data type
//let decimalInt = 17             // 十進位
//let binaryInt = 0b10001         // 二進位
//let octalInt = 0o21             // 八進位
//let hexInt = 0x11               // 十六進位

//print(decimalInt)
//print(binaryInt)
//print(octalInt)
//print(hexInt)

//let oneMillion = 1_000_000      // 千位數隔開，提高可讀性
//print(oneMillion)

//let justOverOneMillion = 1_000_000.000_000_1    // 千位數隔開，提高可讀性
//print(justOverOneMillion)

//let a = 1.25e2  // 1.25 * 10^2 = 125.0
//let b = 1.25e-2 // 1.25 * 10^-2 = 0.0125

//print(a)
//print(b)

//let c = 0xFp2       // 15 * 2^2 = 60.0
//let d = 0xFp-2      // 15 * 2^-2 = 3.75

//print(c)
//print(d)

//let e = 0xC.3p0 // C * 16^0 + 3 * 16^-1 = 12 + 3/16 = 12.1875
//print(e)

// Type Aliases
//typealias MyInt = Int64     // 定義一種新的資料型別，本質是 Int64
//print(MyInt.max)        // 9223372036854775807

//typealias XYPoint = (x: Double, y: Double)

//let p: XYPoint = (1.0, 2.0)

//print(p.x)
//print(p.y)

// Bool
//let a = 1

//if a {
//}   // Compile Error


//if a == 1 {
//}   // Compile OK

// Tuple
//let p = (1.0, 2.0)	// 將兩組 Double 變數，組成一個 Tuple

//print(p.0)	// 取第一個值。
//print(p.1)	// 取第二個值。

//let (x, y) = p	// 分解 tuple

//print(x)
//print(y)

// Optional
//var a: Int? = 10		// 宣告方式：資料型別 + ?
//print(a)				// Optional(10)

//a = nil					// 可以 assign nil
//print(a)				// nil

let possibleString: String? = "An optional string."
print(possibleString!)

let assumedString: String! = "An implicitly unwrapped optional string."
print(assumedString)

let c: String! = nil
print(c)

if let defined = c {
  print(defined)
}
else {
  print("not defined")
}
