// Tubple and swap
//var (x, y) = (1, 2)
//print("(x, y) = (\(x), \(y))")

//(x, y) = (y, x)
//print("(x, y) = (\(x), \(y))")

// Remainder
print(8 % 3)
print(-9 % 2)
print(-9 % -2)

// Comparison
print((1, "zebra") < (2, "apple"))  // true
print((3, "apple") >= (3, "bird"))  // false
print((4, "dog") == (4, "dog"))     // true

// Nil-Calescing
let possibleNumber = "123"

let test = 123 + (Int(possibleNumber) ?? 0)

print(test)

// Range
for i in 0...5 {
    print(i)        // print 0 ~ 5
}

for i in 0..<5 {
    print(i)        // print 0 ~ 4
}
