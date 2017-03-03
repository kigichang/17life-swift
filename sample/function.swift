/*func total(price: Int, number: Int) -> Int {
    return price * number
}

func total(size: Int, number: Int) -> Int {
    return size * number * 2
}

func total(_ amount: Int, _ number: Int) -> Int {
    return amount * number * 3
}

print(total(price: 10, number: 20)) // 200
print(total(size: 10, number: 20))  // 400
print(total(10, 20))                    // 600


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


func abc(a: Int, b: Int) -> Int {
    a += a  // compile error

    return a + b
}

print(abc(a: 10, b: 20))
*/
/*
func swap(a: inout Int, b: inout Int) {
    (a, b) = (b, a)
}

var a = 10, b = 20

print("a=\(a), b=\(b)")
swap(&a, &b)
print("a=\(a), b=\(b)")

let c = 30, d = 40
print("c=\(c), d=\(d)")
swap(&c, &d)    // compile error
//print("a=\(c), b=\(d)")

//swap(20, &d)    // compile error

//func abc(a: inout Int...) { // compile error

//}
*/
/*
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


*/
/*
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
*/
