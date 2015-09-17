// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Dictionaries
// ---------------------------------------------------------------



var cpus = ["BBC Model B":"6502", "Lisa":"68000", "TRS-80":"Z80"]
let cpusMaster = cpus



// ------------------------------------------
// Accessing Dictionary Elements
// ------------------------------------------

let cpu = cpus["BBC Model B"]



// ------------------------------------------
// Dictionary Properties
// ------------------------------------------

cpus.count
cpus.isEmpty
let keys = [String](cpus.keys)
let values = [String](cpus.values)



// ------------------------------------------
// Modifying a Mutabale Dictionary
// ------------------------------------------

cpus["Macintosh"] = "PowerPC"
cpus
let oldValue = cpus.updateValue("x86", forKey:"Macintosh")
cpus
cpus.popFirst()
cpus
cpus.removeAll()

cpus = cpusMaster
let removedValue = cpus.removeValueForKey("Lisa")
cpus



// ------------------------------------------
// Iterating Over A Dictionary
// ------------------------------------------

print ("\n-iterating over a dictionary")
for (make, processor) in cpusMaster {
    print ("The", make, "is powered by the", processor, "microprocessor")
}

print ("\n-iterating over a dictionary's values")
for processor in cpusMaster.values {
    print (processor)
}



// ------------------------------------------
// Inherited Behaviour
// ------------------------------------------

var end = cpusMaster.endIndex
var start = cpusMaster.startIndex
start == end


cpus = cpusMaster
var i = cpus.indexForKey("Lisa")
cpus[i!]


cpus = cpusMaster
let (k1, v1) = cpus.popFirst()!
k1
v1
cpus


let (k2, v2) = cpus.removeAtIndex(start.successor())
k2
v2
cpus




