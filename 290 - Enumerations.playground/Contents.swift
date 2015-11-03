// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Enumerations
// ---------------------------------------------------------------


enum TravelClass {
    case First
    case Business
    case Economy
}


enum TravelClassBrief {
    case First, Business, Economy
}


var thisTicket = TravelClass.First
var thatTicket: TravelClass
thatTicket = .Economy




// ------------------------------------------
// Raw Member Values
// ------------------------------------------

enum AtomicNumber: Int {
    case Hydrogen = 1
    case Helium = 2
    case Lithium = 3
    case Beryllium = 4
}


enum AtomicNumberBrief: Int {
    case Hydrogen = 1, Helium, Lithium, Beryllium
}


AtomicNumber.Lithium.rawValue
// returns 3

var mysteryElement = AtomicNumber.Helium
mysteryElement.rawValue
// returns 2


if let r = AtomicNumber(rawValue: 2) {
    print (r)
} else {
    print ("there was no matching member for the raw value 2")
}


var s: String
if let r = AtomicNumber(rawValue: 3) {
    s = "\(r)"
} else {
    s = ""
}




// ------------------------------------------
// Associated Values
// ------------------------------------------

enum NetworkAddress {
    case MAC(String)
    case IPv4(UInt8, UInt8, UInt8, UInt8)
}


var routerAddress = NetworkAddress.IPv4(192, 168, 0, 1)
var dnsServerAddress = NetworkAddress.IPv4(8, 8, 8, 8)
var ethernetIF = NetworkAddress.MAC("00:DE:AD:BE:EF:00")


var someAddress = NetworkAddress.IPv4(192, 168, 0, 1)
someAddress = NetworkAddress.MAC("00:DE:AD:BE:EF:00")
someAddress = NetworkAddress.IPv4(10, 10, 0, 1)


someAddress = NetworkAddress.IPv4(10, 10, 0, 1)
switch someAddress {
case .MAC:
    print ("got a MAC address")
case .IPv4:
    print ("got an IP address")
}
// prints "got an IP address"


someAddress = NetworkAddress.MAC("00:DE:AD:BE:EF:00")
switch someAddress {
case let .MAC(theaddress):
    print ("got a MAC address of \(theaddress)")
case let .IPv4(a, b, c, d):
    print ("got an IP address with" +
        "a low octet of \(d)")
}
// prints "got a MAC address of 00:DE:AD:BE:EF:00"




// ------------------------------------------
// Methods in Enumerations
// ------------------------------------------

enum NetworkAddress2 {
    case MAC(String)
    case IPv4(UInt8, UInt8, UInt8, UInt8)
    
    func printable() -> String
    {
        switch self {
        case let .MAC(theAddress):
            return theAddress
        case let .IPv4(a, b, c, d):
            return ("\(a).\(b).\(c).\(d)")
        }
    }
}

var deviceAddress = NetworkAddress2.IPv4(192, 168, 0, 1)
deviceAddress.printable()
// returns "192.168.0.1"
deviceAddress = NetworkAddress2.MAC("00:DE:AD:BE:EF:00")
deviceAddress.printable()
// returns "00:DE:AD:BE:EF:00"




// ------------------------------------------
// Recursive Enumerations
// ------------------------------------------

indirect enum List {
    case Empty
    case SubList(head: Int, tail: List)
}

let list1 = List.SubList(head: 4, tail: List.Empty)
let list2 = List.SubList(head: 1, tail: list1)
let list3 = List.SubList(head: 2, tail: list2)
print (list3)




// ------------------------------------------
// Failable Initializers in Enumerations
// ------------------------------------------





