// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Protocols
// ---------------------------------------------------------------


import Foundation



// ------------------------------------------
// Required Properties
// ------------------------------------------

protocol SomeProtocol
{
    var aWritableProperty: Double { get set }
    var aReadOnlyProperty: Int { get }
    static var aTypeProperty: String { get set }
}




// ------------------------------------------
// Required Methods
// ------------------------------------------

protocol Printable
{
    func printable() -> String
}




// ------------------------------------------
// Optional Methods and Properties
// ------------------------------------------

@objc protocol Optionals
{
    optional var optProperty: String { get }
    optional func optMethod(i: Int) -> String
}


class ImplementsProperty: Optionals
{
    @objc let optProperty = "I'm a property!"
}

class ImplementsMethod: Optionals
{
    @objc func optMethod(i: Int) -> String
    {
        return "I'm a method and was passed \(i)"
    }
}


var optA: Optionals = ImplementsProperty()
var optB: Optionals = ImplementsMethod()

optA.optProperty.dynamicType
optA.optProperty
optB.optProperty

// optA.optMethod(45) // compile-time error
optA.optMethod?(45)

optB.optMethod?(1)
// returns an optional String? "I am a method and was passed 1"

optB.optProperty
// returns nil




// ------------------------------------------
// Adopting Protocols with Extensions
// ------------------------------------------

extension Bool: Printable
{
    func printable() -> String
    {
        return self ? "YES":"NO"
    }
}

var a = false
a.printable()
// returns "NO"




// ------------------------------------------
// Inheritance and Protocols
// ------------------------------------------

protocol Hexable : Printable
{
    func asHex() -> String
}


extension Bool: Hexable
{
    func asHex() -> String
    {
        return self ? "1":"0"
    }

    // in this playground, we can't define printable here, because it's
    // already defined earlier in this file as part of a separate example
//    func printable() -> String
//    {
//        return self ? "YES":"NO"
//    }
    
}


var b = true
b.asHex()
b.printable()




// ------------------------------------------
// Using a Protocol as a Type
// ------------------------------------------

extension Int: Hexable
{
    func asHex() -> String
    {
        var temp = self
        var result = ""
        let digits = Array("0123456789abcdef".characters)
        while (temp > 0) {
            result = String(digits[Int(temp & 0x0f)]) + result
            temp >>= 4
        }
        return result
    }
    
    func printable() -> String
    {
        return "\(self)"
    }
    
}


var c: Hexable = true
c.printable()    // returns "YES"
c.asHex()        // returns "1"
c = 45
c.printable()    // returns "45"
c.asHex()        // returns "2d"


var ar = [Hexable]()
ar.append(true)
ar.append(45)
ar[0].asHex()     // returns "1"
ar[1].asHex()     // returns "2d"




// ------------------------------------------
// Checking Protocol Conformance
// ------------------------------------------

@objc protocol DemoProto
{
}

class DemoClass: DemoProto
{
}

func protoCheck(t: AnyObject) -> Bool
{
    return t is DemoProto
}


var s = DemoClass()
var i = 4
protoCheck(s)  // returns true
protoCheck(i)  // returns false




// ------------------------------------------
// Protocol Extensions
// ------------------------------------------

extension UnsignedIntegerType
{
    var asHex: String {
        var temp: UInt = numericCast(self)
        var result = ""
        let digits = Array("0123456789abcdef".characters)
        for _ in 0..<sizeof(self.dynamicType) * 2 {
            result = String(digits[Int(temp & 0x0f)]) + result
            temp >>= 4
        }
        return result
    }
}

let u1: UInt8 = 16
let u2: UInt16 = 38
let u3: UInt32 = 32767
u1.asHex
u2.asHex
u3.asHex






