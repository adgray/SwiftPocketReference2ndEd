// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Global Functions
// ---------------------------------------------------------------



// set up some things we'll use later
class AClass
{
}

class BClass: AClass
{
}

class CClass
{
}

class DClass : NonObjectiveCBase
{
}

struct S1 {
    var i = 0
    var x = 1.0
    var b = false
    var c = true
    var d = false
}





// abs(x)
let absVar1 = abs(-34)   // returns Int of 34
let absVar2 = abs(12)    // returns Int of 12
let absVar3 = abs(-76.5) // returns Double as 76.5



// alignof(type)
let alignVar1 = alignof(Int)    // Int aligns to 8 bytes
let alignVar2 = alignof(Int8)   // Int8 aligns to 1 byte
let alignVar3 = alignof(Double) // Double aligns to 8 bytes



// alignofValue(value)
let alignVar4 = alignofValue("Hello")  // Strings align to 8
let alignVar5 = alignofValue(Int16(1)) // Int16s align to 2



// anyGenerator(body)
var genState = 0
let genSeq = anyGenerator { genState++ }
genSeq.next()  // returns 0
genSeq.next()  // returns 1
genSeq.next()  // returns 2



// assert(condition: Bool [, message: String])
let assertVal = false
assert(assertVal == false, "Argh! Booleans are broken")



// assertionFailure([message: String])
// will abort playground execution if uncommented
// assertionFailure("Should not have run this")



// debugPrint(items... [, separator: String] [, terminator: String] [, toStream: &target])
var debugStr = "We're "
debugPrint(debugStr, "using debugPrint")
debugPrint("Line 1", "Line 2", separator:"\n", terminator:"\n*****")
debugPrint("sending our love down the well", toStream: &debugStr)
debugStr



// dump(instance)
let dump1 = ["Hello", "Lemon", "Bill", "Ben"]
dump(dump1)



// fatalError([message: String])
// will abort playground execution if uncommented
// fatalError("Should not have run this")



// getVAList(args: CVarArgType)



// isUniquelyReferenced(inout x: NonObjectiveCBase)
var inst1 = DClass()
var inst2 = DClass()
var inst3 = inst2
isUniquelyReferenced(&inst1) // should be true (only one reference)
isUniquelyReferenced(&inst2) // should be false (two references)



// isUniquelyReferencedNonObjC(inout x)
var inst4 = DClass()
var inst5 = DClass()
var inst6 = inst5
isUniquelyReferencedNonObjC(&inst4) // should be true (only one reference)
isUniquelyReferenced(&inst5)        // should be false (two references)



// max(list)
let maxVar = max(11, 100, 92, 67) // assigns 100



// min(list)
let minVar = min(11, 100, 92, 67) // assigns 11



// numericCast(x)
func f1 (x: Int) { }
let i8: UInt8 = 4
// f1(i8) // will fail since i8 is not an Int
f1(numericCast(i8)) // works - i8 gets cast to correct Int type automatically



// precondition(condition: Bool[, message: String])
precondition(assertVal == false, "Argh! Booleans are broken")



// preconditionFailure([message: String])
// will abort playground execution if 
// preconditionFailure("Should not have run this")



// print(items... [, separator: String] [, terminator: String] [, toStream: &target])
print ("Hi")
print ("Hi", "there")
print ("Hi ", terminator: "")
print ("there again")
print (192, 168, 0, 1, separator: ".")
var receiver: String = ""
print ("This is being sent to a string", toStream: &receiver)
receiver



// readLine([stripNewLine: Bool])
// works in a swift script, but not in a playground
// let someInput = readLine()



// sizeof(Type)
var s1inst = S1()

let sizeofVar1 = sizeof(Int)    // Int requires 8 bytes
let sizeofVar2 = sizeof(Int8)   // Int8 requires  1 byte
let sizeofVar3 = sizeof(Double) // Double requires 8 bytes
let sizeofVar4 = sizeof(S1)     // Struct requires size of properties


// sizeofValue(x)
let sizeofVar5 = sizeofValue(2)        // Int requires 8 bytes
let sizeofVar6 = sizeofValue(Int8(2))  // Int8 requires  1 byte
let sizeofVar7 = sizeofValue(4.5)      // Double requires 8 bytes
let sizeofVar8 = sizeofValue(s1inst)   // Struct requires size of properties



// strideof(Type)
let strideofVar1 = strideof(Int)    // Int stride is 8 bytes
let strideofVar2 = strideof(Int8)   // Int8 stride  1 byte
let strideofVar3 = strideof(Double) // Double stride 8 bytes
let strideofVar4 = strideof(S1)     // Struct stride is size of properties, rounded up to next multiple of 8



// strideofValue(x)
let strideofVar5 = strideofValue(2)       // Int stride is 8 bytes
let strideofVar6 = strideofValue(Int8(2)) // Int8 stride is 1 byte
let strideofVar7 = strideofValue(4.5)     // Double stride is 8 bytes
let strideofVar8 = strideofValue(s1inst)  // Struct stride is size of properties, rounded up to next multiple of 8



// swap(&x, &y)
var swapA = 56
var swapB = 72
swap (&swapA, &swapB)
swapA
swapB



// transcode(inputEncoding: InputEncoding.Type, outputEncoding: outputEncoding.Type, input: Input, output: Output, stopOnError: Bool)



// unsafeAddressOf(x)
var anInst = AClass()
let ptr1 = unsafeAddressOf(anInst)


// unsafeBitCast(x, t)
let int1: Int8 = -10
let int2: UInt8 = unsafeBitCast(int1, UInt8.self)



// unsafeDowncast(x)
var safeInstA = AClass()
var safeInstB = BClass()
var safeInstC = CClass()
var unsafeRef1: AClass = unsafeDowncast(safeInstB)
// var unsafeRef2: AClass = unsafeDowncast(safeInstC)  // will crash
// since safeInstC is not an AClass



// unsafeUnwrap()
var someOptional: String? = "Hello"
let unsafeUnwrapInst = unsafeUnwrap(someOptional)



// withExtendedLifetime(x, f)



// withUnsafeMutablePointer()
var someInt = 16
print ("Before:", someInt)
withUnsafeMutablePointer(&someInt) { p in p.memory = 32 }
print (someInt)
print ("After:", someInt)



// withUnsafeMutablePointers()



// withUnsafePointer()



// withUnsafePointers()



// withVaList(args: [CVarArgType], f)



// zip(SequenceType1, SequenceType2)
let zipSeq1 = ["alpha", "beta", "gamma"]
let zipSeq2 = [65, 66, 67]
let zipResult = zip(zipSeq1, zipSeq2)
let zippedArray = Array(zipResult)





