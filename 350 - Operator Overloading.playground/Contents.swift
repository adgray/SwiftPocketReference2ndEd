// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Operator Overloading
// ---------------------------------------------------------------


struct Rect
{
    var x = 0.0, y = 0.0, width = 0.0, height = 0.0
    
    func area() -> Double
    {
        return (width * height)
    }
}


func + (left: Rect, right: Rect) -> Rect
{
    return Rect (
        x: min(left.x, right.x),
        y: min(left.y, right.y),
        width: max(left.width, right.width),
        height: max(left.height, right.height)
    )
}


var a = Rect (x:5, y:5, width:5, height:5)
var b = Rect (x:6, y:6, width:10, height:10)
var c = a + b
dump (c)
// c is now a Rect where
// (x=5.0, y=5.0, width=10.0, height=10.0)


func < (left: Rect, right: Rect) -> Bool
{
    return left.area() < right.area()
}


var e = Rect(x:0, y:0, width:4, height:5)
var f = Rect(x:5, y:5, width:5, height:5)
e<f
// returns true




// ------------------------------------------
// Overloading Unary Operators
// ------------------------------------------

postfix func ++ (inout r: Rect) -> Rect
{
    let temp = r;
    r.x += 1.0
    r.y += 1.0
    return temp
}


var d = Rect(x:5, y:5, width:5, height:5)
d++
dump(d)
// returns a Rect where
// (x=5.0, y=5.0, width=5.0, height=5.0)
// but d is a Rect where
// (x=6.0, y=6.0, width=5.0, height=5.0)




// ------------------------------------------
// Custom Operators
// ------------------------------------------

import Darwin

prefix operator √ {}

prefix func √ (operand: Double) -> Double
{
    return sqrt(operand)
}

print (√25)
// outputs 5.0



