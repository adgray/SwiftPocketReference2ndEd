// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Closures
// ---------------------------------------------------------------


// default sort (of Arrays)
let names = ["John", "Zoe", "Laura", "albert", "Allen"]
let s = names.sort()
// s is now ["Allen", "John", "Laura", "Zoe", "albert"]



// sort() using a closure - fully specified
let t1 = names.sort(
    { (s1: String, s2: String) -> Bool in
        return s1<s2 }
)


// sort() using a closure - with inferred types
let t2 = names.sort( { s1, s2 in return s1<s2 } )
t2


// sort() using a closure - omitting return
let t3 = names.sort( { s1, s2 in s1<s2 } )
t3


// sort() using a closure - reversing the sort
let t4 = names.sort( { s1, s2 in s2<s1 } )
t4


// sort() using a closure - alternate way of reversing the sort
let t5 = names.sort( { s1, s2 in s1>=s2 } )
t5


// sort() using a closure - using string length
let t6 = names.sort( { s1, s2 in
    s1.characters.count  < s2.characters.count } )
t6



// ------------------------------------------
// Automatic Argument Names
// ------------------------------------------

let u1 = names.sort( { $0 < $1 } )
let u2 = names.sort( { $1 < $0 } )
let u3 = names.sort( { $0.characters.count  < $1.characters.count } )
u1
u2
u3



// ------------------------------------------
// Trailing Closures
// ------------------------------------------

let v1 = names.sort() { $0 < $1 }
let v2 = names.sort() { $1 < $0 }
let v3 = names.sort() { $0.characters.count  < $1.characters.count }
v1
v2
v3

let w1 = names.sort { $0 < $1 }
let w2 = names.sort { $1 < $0 }
let w3 = names.sort { $0.characters.count  < $1.characters.count }
w1
w2
w3



// ------------------------------------------
// Capturing Values
// ------------------------------------------

func makeTranslator(greeting: String) -> (String) -> String
{
    return {
        (name: String) -> String in
        return (greeting + " " + name)
    }
}

var englishWelcome = makeTranslator("Hello")
var germanWelcome = makeTranslator("Guten Tag")

englishWelcome ("Bill")
// returns "Hello Bill"
germanWelcome ("Johan")
// returns "Guten Tag Johan"

englishWelcome = makeTranslator("G'day")
englishWelcome ("Bruce")
// returns "G'day Bruce"



// ------------------------------------------
// Capturing Values by Reference
// ------------------------------------------

func makeCountingTranslator(greeting: String, _ personNo: String) -> (String) -> String
{
    var count = 0
    
    return {
        (name: String) -> String in
        count++
        return (greeting + " " + name + ", " + personNo + " \(count)")
    }
}

var germanReception = makeCountingTranslator("Guten Tag", "Sie sind Nummer")
var aussieReception = makeCountingTranslator("G'day", "you're number")

germanReception ("Johan")
// returns "Guten Tag Johan, Sie sind Nummer 1"
aussieReception ("Bruce")
// returns "G'day Bruce, you're number 1"
aussieReception ("Kylie")
// returns "G'day Kylie, you're number 2"



