// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Arrays
// ---------------------------------------------------------------




// var arrayName = [Type]()
var daysOfWeek = [String]()

var vertex = [Double](count: 10, repeatedValue: 0.0)

var locos: [String] = ["Puffing Billy", "Thomas"]
let daysPerMonth: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 31, 31]
var primes = [1, 3, 5, 7, 11]

let v = vertex[5]

let vowels = ["A", "E", "I", "O", "U"]
let consonants = ["B", "C", "D",  "F", "G", "H", "J" /* etc */]
var allLetters = vowels + consonants



// ------------------------------------------
// Accessing Array Elements
// ------------------------------------------

let days = daysPerMonth[5]

let daysPerNorthernSummerMonth = daysPerMonth[5...7]

daysPerMonth.first
daysPerMonth.last
primes.maxElement()
daysPerMonth.minElement()



// ------------------------------------------
// Array Properties
// ------------------------------------------

daysPerMonth.capacity
daysPerMonth.count
daysPerMonth.isEmpty



// ------------------------------------------
// Modifying a Mutable Array
// ------------------------------------------

primes.append(13)
primes += daysPerMonth

primes[2] = 100
primes

primes[2...3] = [5, 19, 7]
primes

primes.insert(4, atIndex:2)
primes.removeAtIndex(2)
primes.removeLast()

primes.reserveCapacity(200)
primes.capacity



func ascending (i: Int, j: Int) -> Bool {
    return i < j
}

func descending (i: Int, j: Int) -> Bool {
    return j < i
}

primes.sortInPlace()
primes.sortInPlace(descending)
primes.sortInPlace { $0 < $1 }
primes

primes.removeAll()



// ------------------------------------------
// Iterating Over Arrays
// ------------------------------------------

print ("\n-vowels")
for i in vowels {
    print (i)
}

print ("\n-locomotives dictionary")
for (index, value) in locos.enumerate() {
    print ("\(index): \(value)")
}



// ------------------------------------------
// Inherited Behaviour
// ------------------------------------------

var names = ["John", "Zoe", "Laura", "albert", "Allen"]

names.contains("John")
names.contains("Lisa")

let namesCopy = names
names.elementsEqual(namesCopy)
names.elementsEqual(namesCopy.sort())

let aa1 = names.filter { $0.characters.count > 4 }
aa1

let arrOfArrays = [["Bill", "Fred"], ["Mary"]]
let flatArray = arrOfArrays.flatMap()
    {$0.map{$0.uppercaseString}}
flatArray


let aa2 = names.map { $0.hasPrefix("A") ? $0 : "*" + $0 }
aa2

let aa3 = names.reduce("") { $0 + $1 }
aa3

let aa4 = names.reverse() as Array
aa4

let aa5 = names.sort() { $0<$1 }
aa5


names.startsWith(["John", "Zoe"])
names.startsWith(["Allen"])








