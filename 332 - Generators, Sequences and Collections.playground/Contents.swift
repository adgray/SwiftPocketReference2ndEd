// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Generators, Sequences, Collections
// ---------------------------------------------------------------



// ------------------------------------------
// Generators
// ------------------------------------------
print ("GENERATOR Examples:")

// a simple integer sequence generator

var state = 0
let intSeq = anyGenerator { state++ }

intSeq.next()  // returns 0
intSeq.next()  // returns 1
intSeq.next()  // returns 2



// a simple integer sequence generator

var intSeq2: AnyGenerator<Int>

do {
    var n = 10  // the state, which will go out of scope
    intSeq2 = anyGenerator { n++ }
}

intSeq2.next()  // returns 10
intSeq2.next()  // returns 11
intSeq2.next()  // returns 12



// generates multiples of 7, until 12*7 is reached

var stepState = 0
let stepBy7 = anyGenerator {
    () -> Int? in
        if (stepState < (12*7))
        {
            stepState += 7
            return stepState
        }
        return nil
    }

let a = Array(stepBy7)
a

stepState = 0
let b = Array(stepBy7)



// generate times tables

func timesTable(which: Int) -> [Int]
{
    var i = 0
    return Array(anyGenerator { return i++ < 12 ? i * which : nil })
}

timesTable(1)
timesTable(2)
timesTable(5)



// a struct-based generator by adoping the protocol

struct timesTable2 : GeneratorType
{
    var table: Int
    var state: Int = 0

    init(_ table: Int) { self.table = table }

    typealias Element = Int
    mutating func next() -> Element?
    {
        return (state++ < 12) ? state * table : nil
    }
}

var ttGen = timesTable2(6)
print ("6 times table:")
while let i = ttGen.next() {
    print (i, terminator: ", ")
}




// ------------------------------------------
// Sequences
// ------------------------------------------
print ("\n\nSEQUENCE Examples:")

// a struct-based sequence

struct timesTable3 : SequenceType
{
    var table: Int
    init(_ table: Int) { self.table = table }

//  the typealias can be inferred here, so the
//  following line isn't necessary
//  typealias Generator = AnyGenerator<Int>
    
    func generate() -> AnyGenerator<Int> {
        var state = 0
        return anyGenerator( { state++ < 12 ? state * self.table : nil } )
    }
}

print ("7 times table:")
var f = timesTable3(7)
for i in f {
    print (i, terminator: ", ")
}


print ("\n4 times table:")
for i in timesTable3(4) {
    print (i, terminator: ", ")
}

let c = timesTable3(3).map( {$0 * 2} ).filter( {$0 % 4 == 0 } )
c

timesTable3(9).contains(18)
timesTable3(9).contains(12)




// ------------------------------------------
// Collections
// ------------------------------------------

// a collection-based collection

struct timesTable4 : CollectionType
{
    var table: Int
    init(_ table: Int) { self.table = table }
    
    typealias Index = Int
    let startIndex = 1
    let endIndex = 13
    
    func generate() -> AnyGenerator<Int>
    {
        var state = startIndex
        return anyGenerator( { state < self.endIndex ? state++ * self.table : nil } )
    }
    
    subscript(i: Index) -> Index {
        return i * self.table
    }
}


print ("\n\nCOLLECTION Examples:")
print ("9 times table in reverse:")
let d = timesTable4(9).reverse() as Array

print ("\n8 times table:")
timesTable4(8).forEach( { print ($0, terminator: ", ") } )

print ("\nsubscripted access:")
print(timesTable4(6)[2])



