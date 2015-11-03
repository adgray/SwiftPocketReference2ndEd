// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Checking and Casting Types
// ------------------------------------------


// ------------------------------------------
// Any and AnyObject
// ------------------------------------------

var v = [Any]()
v.append(2)
v.append(3.4)
v.append("crunch")




// ------------------------------------------
// Checking Types
// ------------------------------------------

class A { }
class B: A { }
class C { }

var a = A()
var b = B()
var c = C()

func typeCheck(t: AnyObject) -> Bool
{
    return t is A
}

typeCheck(a) // true
typeCheck(b) // true
typeCheck(c) // false




// ------------------------------------------
// Downcasting Types
// ------------------------------------------

class Shape { }
class Square: Shape
{
    func describe()
    {
        print("I am a square")
    }
}
class Circle: Shape
{
    func identify()
    {
        print("I am a circle")
    }
}


var shapes = [Shape]()

let sq = Square()
let ci = Circle()

shapes.append(sq)
shapes.append(ci)


for s in shapes
{
    if let c = s as? Circle {
        // c is now a reference to an array entry downcast
        // as a circle instead of as a generic shape
    } else {
        // downcast failed
    }
}


for s in shapes
{
    switch s {
    case let cc as Circle:
        cc.identify()
    case let ss as Square:
        ss.describe()
    default:
        break;
    }
}


for s in shapes {
    if s is Circle {
        let c = s as! Circle
        c.identify()
    }
}


