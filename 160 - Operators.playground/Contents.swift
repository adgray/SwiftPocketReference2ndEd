// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Operators
// ---------------------------------------------------------------



// ------------------------------------------
// No implicit Type Conversion
// ------------------------------------------

var i = 2
var f = 45.0
//let errResult = (f / i)  // error
let result = (f / Double(i))



// ------------------------------------------
// Atithmetic Operators
// ------------------------------------------

4 + 5
"A" + "B"

var a: UInt8 = UInt8.min
//a = a - 1  // arithmetic underflow runtime error


var postInt: Int = 0
var postFloat: Float = 0.5
var postDouble: Double = 0.6
postInt++
postFloat++
postDouble++
postInt
postFloat
postDouble


var preInt: Int = 10
var preFloat: Float = 10.5
var preDouble: Double = 10.6
++preInt
++preFloat
++preDouble
preInt
preFloat
preDouble



// ------------------------------------------
// Bitwise Operators
// ------------------------------------------

let boA: UInt8 = 0
let boB: UInt8

~boA
0x80 & 0xFF
0x80 | 0xC0
0xF0 ^ 0x80
0x01 << 2
0x80 >> 1



// ------------------------------------------
// Compound Assignment Operators
// ------------------------------------------

var v: Int = 0
v += 32
v -= 16
v *= 2
v /= 4
v %= 7
v <<= 4
v >>= 1
v &= 0x0f
v |= 0x07
v ^= 0xff



// ------------------------------------------
// Comparison Operators
// ------------------------------------------

true == false
true != false
5 < 10
5 <= 5
5 > 10
5 >= 10

class DemoClass { }
let m = DemoClass()
let n = DemoClass()
let o = m

m === n
m === o
m !== n
m !== o



// ------------------------------------------
// Logical Operators
// ------------------------------------------

!true

true && true
true && false
false && false

true || true
true || false
false || false



// ------------------------------------------
// Overflow Operators
// ------------------------------------------

UInt8(200) &+ UInt8(100)
UInt8(50) &- UInt8(100)
UInt8(16) &* UInt8(16)

let (overflowResult, overflow) = UInt8.addWithOverflow(200, 100)
overflowResult
overflow


// ------------------------------------------
// Type Casting Operators
// ------------------------------------------

// (see samples in later playgrounds)



// ------------------------------------------
// Range Operators
// ------------------------------------------
print ("\n-range operators")
for i in 1...5 {
    print ("\(i), ", terminator: "")
}
print("")
for i in 1..<5 {
    print ("\(i), ", terminator: "")
}




// ------------------------------------------
// Ternary Conditional Operator
// ------------------------------------------

let leapYear = true
let februaryDays = leapYear ? 29 : 28


