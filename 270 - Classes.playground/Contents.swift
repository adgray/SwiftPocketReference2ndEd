// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Classes
// ---------------------------------------------------------------


// ------------------------------------------
// Defining a base class
// ------------------------------------------

class Processor
{
    var dataWidth = 0
    var addressWidth = 0
    var registers = 0
    var name = ""
}



// ------------------------------------------
// Instances
// ------------------------------------------

let proc = Processor()

proc.name = "Z80"
proc.dataWidth = 8
print (proc.name)


var newProc = proc

proc.name = "6502"
print (newProc.name)
// will output "6502"


if (proc === newProc) {
    print ("references are to same instance")
}
// will output "references are to same instance"




// ------------------------------------------
// Properties
// ------------------------------------------

proc.name = "6502"
// assigns "6502" to the name property of the proc instance

print ("data width is", proc.dataWidth)
// outputs the dataWidth property of the proc instance




// ------------------------------------------
// Lazy Properties
// ------------------------------------------

class LazyClass
{
    var aString = "elephant"
    lazy var bString: String = self.aString + " trunk"
}

var lazyInst = LazyClass()
lazyInst.aString // returns "elephant"
lazyInst.aString = "tree"
lazyInst.bString // returns "tree trunk"





// ------------------------------------------
// Computed Properties
// ------------------------------------------

class Rect
{
    var x = 0.0, y = 0.0
    var width = 0.0, height = 0.0
    var area: Double { return (width * height) }
}

var q = Rect()
q.width = 2.7
q.height = 1.4
q.area
// returns 3.78




// ------------------------------------------
// Property Observers
// ------------------------------------------

class Observer
{
    var name: String = "" {
        willSet {
            print (name, "is about to be changed to", newValue)
        }
        didSet {
            print (oldValue, "was just changed to", name)
        }
    }
}

let observerDemo = Observer()
observerDemo.name = "Swift 1.0"
observerDemo.name = "Swift 2.0"




// ------------------------------------------
// Static stored properties
// ------------------------------------------


class Employee
{
    static var nextID = 1
    
    var familyName = ""
    var givenName = ""
    var employeeID = 0
}

var emp = Employee()
emp.familyName = "Smith"
emp.givenName = "Fred"
emp.employeeID = Employee.nextID++
Employee.nextID





// ------------------------------------------
// Computed type properties
// ------------------------------------------

class BetterEmployee
{
    private static var _nextID = 1
    
    class var nextID: Int
    {
        get { return _nextID }
        set { _nextID = newValue }
    }

    var familyName = ""
    var givenName = ""
    var employeeID = 0
}

var be = BetterEmployee()
be.familyName = "Smith"
be.givenName = "Fred"
be.employeeID = BetterEmployee.nextID++
BetterEmployee.nextID





// ------------------------------------------
// Constant properties
// ------------------------------------------

class ConstPropClass
{
    let cp: Int
    
    init(v: Int)
    {
        self.cp = v
    }
}

var cpDemo = ConstPropClass(v: 8)
cpDemo.cp
// returns 8




// ------------------------------------------
// Methods
// ------------------------------------------

class Rect2
{
    var x = 0.0, y = 0.0
    var width = 0.0, height = 0.0
    func area() -> Double
    {
        return width * height
    }
}

var r2 = Rect2()
r2.width = 5.0
r2.height = 2.0
r2.area()
// returns 10.0




// ------------------------------------------
// Self
// ------------------------------------------

class Rect3
{
    var x = 0.0, y = 0.0
    var width = 0.0, height = 0.0
    func area() -> Double
    {
        return width * height
    }
    func sameSizeAs(width  width: Double, height:Double) -> Bool
    {
        return width == self.width && height == self.height
    }
}

var r3 = Rect3()
r3.width = 5.0
r3.height = 2.0
r3.sameSizeAs(width:5.0, height: 2.0)
r3.sameSizeAs(width:8.0, height: 2.0)




// ------------------------------------------
// Type methods
// ------------------------------------------





// ------------------------------------------
// Subscripts
// ------------------------------------------

class Byte
{
    var d: UInt8 = 0
    
    subscript(whichBit: UInt8) -> UInt8
        {
        get { return (d >> whichBit) & 1 }
        set {
            let mask = 0xFF ^ (1 << whichBit)
            let bit = newValue << whichBit
            d = d & mask | bit
        }
    }
}

var b = Byte()
b[0] = 1
// b is now 0000 0001, or 1
b[2] = 1
// b is now 0000 0101, or 5
b[0] = 0
// b is now 0000 0100, or 4




// ------------------------------------------
// Overriding properties
// ------------------------------------------

class Square: Rect
{
    override var width: Double {
        get { return super.width }
        set {
            super.width = newValue
            super.height = newValue
        }
    }
    override var height: Double {
        get { return super.height }
        set {
            super.width = newValue
            super.height = newValue
        }
    }
}

var s = Square()
s.width = 20.0
s.height = 10.0
s.area
// returns 100.0
s.width
// returns 10.0 (not 20.0)




// ------------------------------------------
// Overriding methods and subscripts
// ------------------------------------------

class SafeByte: Byte
{
    override subscript(whichBit: UInt8) -> UInt8 {
        get { return super[whichBit & 0x07] }
        set { super[whichBit & 0x07] = newValue & 1 }
    }
}




// ------------------------------------------
// Preventing Overrides and Subclassing
// ------------------------------------------

class Rect4
{
    var x = 0.0, y = 0.0
    final var width = 0.0, height = 0.0
    func area() -> Double
    {
        return width * height
    }
}

class Rect6
{
    var x, y, width, height: Double
    init()
    {
        x = 0.0; y = 0.0
        width = 0.0; height = 0.0
    }
    init(x: Double, y: Double,
        width: Double, height: Double)
    {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    func area() -> Double
    {
        return width * height
    }
}

let rectI1 = Rect6()
let rectI2 = Rect6(x: 2.0, y: 2.0, width: 5.0, height: 5.0)




// ------------------------------------------
// Conveniennce initializers
// ------------------------------------------

class Processor2
{
    var dataWidth = 0
    var addressWidth = 0
    var registers = 0
    var name = ""
    
    init (name: String, dWidth: Int, aWidth: Int, regs: Int)
    {
        self.name = name
        dataWidth = dWidth
        addressWidth = aWidth
        registers = regs
    }
    
    convenience init (eightbitName: String, regs: Int)
    {
        self.init(name: eightbitName, dWidth:8,
            aWidth:16, regs: regs)
    }
}

var p = Processor2(eightbitName:"6502", regs:3)
p.addressWidth
p.dataWidth
p.name




// ------------------------------------------
// Failable Initializers
// ------------------------------------------

class Employee3
{
    static var nextID = 1
    
    var familyName: String
    var givenName: String
    var employeeID = 0

    init?(familyName: String, givenName: String)
    {
        self.familyName = familyName
        self.givenName = givenName
        if familyName + givenName == "" {
            return nil
        }
        employeeID = Employee3.nextID++
    }
}

var emp1 = Employee3(familyName: "Jones", givenName: "Bob")
var emp2 = Employee3(familyName: "", givenName: "")

emp1?.givenName
emp2?.givenName



class Employee4
{
    static var nextID = 1
    
    var familyName: String
    var givenName: String
    var employeeID = 0
    
    init!(familyName: String, givenName: String)
    {
        self.familyName = familyName
        self.givenName = givenName
        if familyName + givenName == "" {
            return nil
        }
        employeeID = Employee4.nextID++
    }
}

var emp3 = Employee4(familyName: "Jones", givenName: "Bob")
var emp4 = Employee4(familyName: "", givenName: "")

emp3.givenName
emp4




// ------------------------------------------
// Lazy Initializers
// ------------------------------------------





// ------------------------------------------
// Deinitialization
// ------------------------------------------

class ChattyRect: Rect
{
    deinit
    {
        print ("a Rect has gone away")
    }
}

// set up a new scope and create an instance
do {
    var cr = ChattyRect()
}
// with the end of the scope, the instance is deleted and
// should have generated a message inidcating this




