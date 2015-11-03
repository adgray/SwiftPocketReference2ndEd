// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Generics
// ---------------------------------------------------------------


// ------------------------------------------
// Generic Types
// ------------------------------------------

struct Queue<T>
{
    var entries = [T]()
    
    mutating func enqueue(item: T)
    {
        entries.append(item)
    }
    
    mutating func dequeue() -> T
    {
        return entries.removeAtIndex(0)
    }
}


var q1 = Queue<Int>()
q1.enqueue(45)
q1.enqueue(39)
q1.enqueue(61)
q1.enqueue(98)
dump(q1)
// dumps the equivalent of [45, 39, 61, 98]
q1.dequeue()
// returns 45
dump(q1)
// dumps the equivalent of [39, 61, 98]



// ------------------------------------------
// Constraining Types
// ------------------------------------------

struct SignedQueue<T: SignedIntegerType>
{
    var entries = [T]()
    
    mutating func enqueue(item: T)
    {
        entries.append(item)
    }
    
    mutating func dequeue() -> T
    {
        return entries.removeAtIndex(0)
    }
}

// var q2 = SignedQueue<UInt>()
// error – Type 'UInt' does not conform to
// protocol 'SignedIntegerType'



func merge<T:Comparable>(a:[T], _ b:[T]) -> [T]
{
    var output = [T]()
    var i = 0, j = 0
    
    let sizea = a.count
    let sizeb = b.count
    output.reserveCapacity(sizea + sizeb)
    
    while (i < sizea) && (j < sizeb) {
        if a[i] < b[j] { output.append(a[i++]) }
        else { output.append(b[j++]) }
    }
    
    while i < sizea { output.append(a[i++]) }
    while j < sizeb { output.append(b[j++]) }
    
    return output
}

let s = ["allan", "fred", "mike"]
let t = ["brenda", "geraldine", "ruth"]
let u = merge(s, t)
u
// returns "allan", "brenda", "fred",
// "geraldine", "mike", "ruth"

let v = [3, 9, 17, 21]
let w = [1, 2, 12, 36]
let x = merge(v, w)
x



struct SortedArray<T where T:Comparable>
{
    private var elements: [T] = []
    
    init<U where U:SequenceType, U.Generator.Element == T>(_ sequence: U)
    {
        elements = sequence.sort()
    }
    
    // binary search elements for specific value
    private func bsearch(value: T) -> Int
    {
        guard elements.count > 0 else { return 0 }
        
        var middle = 0, lower = 0
        var upper = elements.count - 1
        
        while lower < upper {
            middle = (lower + upper) >> 1
            if elements[middle] < value { lower = middle + 1 }
            else { upper = middle }
        }
        if (elements[lower] < value) { return lower+1 }
        return lower
    }
    
    mutating func insert(value: T)
    {
        elements.insert(value, atIndex: bsearch(value))
    }
}


var sa = SortedArray([15, 3, 9, 7])
sa.insert(13)
sa.elements

var sb = SortedArray(["Wilma", "Albert"])
sb.insert("Geraldine")
sb.elements



// ------------------------------------------
// Generic Protocols
// ------------------------------------------

protocol Queueable
{
    typealias NativeType
    mutating func enqueue(item: NativeType)
    mutating func dequeue() -> NativeType
}


struct StringList: Queueable
{
    var list = [String]()
    
    typealias NativeType = String
    
    mutating func enqueue(item: NativeType)
    {
        list.append(item)
    }
    
    mutating func dequeue() -> NativeType
    {
        return list.removeAtIndex(0)
    }
}


var sl = StringList()
sl.enqueue("Joshua")
sl.enqueue("Nadia")
sl.enqueue("Paul")
sl.dequeue()
// returns "Joshua"
dump(sl)
// dumps ["Nadia", "Paul"] to stdout


