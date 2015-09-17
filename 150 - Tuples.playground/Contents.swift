// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Tuples
// ---------------------------------------------------------------



(4, 5)
(2.0, 4)
("Hello", 2, 1)

var A = (4, 5)
var B = (2.0, 4)
var C = ("Hello", 2, 1)



// ------------------------------------------
// Tuple Variables and Constants
// ------------------------------------------

var a: (String, Int) = ("Age", 6)
let fullName: (String, String) = ("Bill", "Jackson")

var loco = ("Flying Scotsman", 4472, "4-6-2")


// ------------------------------------------
// Extracting tuple components
// ------------------------------------------

let name = loco.0         // assigns "Flying Scotsman"
let number = loco.1       // assigns 4472



// ------------------------------------------
// Naming tuple components
// ------------------------------------------

var person: (name: String, age: Int)
person.name = "Fred"
person.age = 21
let c = person.age

let result = (errCode: 56, errMessage:"file not found")
var s = result.errMessage
// s is now the string "file not found"



// ------------------------------------------
// Using Type Aliases with Tuples
// ------------------------------------------

typealias locoDetail =
    (name: String, number: Int, configuration: String)
var thomas: locoDetail = ("Thomas", 1, "0-6-0")

func getNextLoco() -> locoDetail
{
    // do something then return a value of type locoDetail
    return ("Flying Scotsman", 4472, "4-6-2")
}

var anEngine = getNextLoco()



// ------------------------------------------
// Tuples as Return Types
// ------------------------------------------

func readLine() -> (Bool, String)
{
    // read a line from the file, and set EOF accordingly
    let line = "pretend input"
    let EOF = false
    return (EOF, line)
}

func anotherReadLine() -> (eof: Bool, readLine: String)
{
    // read a line from the file, and set EOF accordingly
    let line = "pretend input"
    let EOF = false
    return (EOF, line)
}



