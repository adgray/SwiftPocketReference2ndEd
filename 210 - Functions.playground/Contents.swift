// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Functions
// ---------------------------------------------------------------


// ------------------------------------------
// Returning Optional Values
// ------------------------------------------

print ("\n-optionals")
func divide(dividend: Double, _ divisor: Double) -> Double?
{
    if (divisor == 0) { return nil }
    return dividend / divisor
}


var d = divide (9.0, 3.0)
if d != nil
{
    // value is valid
    print (d!)
}
else
{
    // value is invalid
}

// let binding
if let d2 = divide(9.0, 3.0)
{
    print (d2)
}



// ------------------------------------------
// Returning Multiple Values by using Tuples
// ------------------------------------------

func getRange() -> (lower: Int, upper: Int)
{
    return (4, 9)
}


print ("\n-tuple returns")
let limits = getRange()
for i in limits.lower...limits.upper {
    print (i)
}



// ------------------------------------------
// Local and External Parameter Names
// ------------------------------------------

func addString (s: String, toString: String) -> String
{
    return toString + s
}
let s1 = addString("apple", toString: "pine")



// ------------------------------------------
// Default Parameter Values
// ------------------------------------------

func addAnotherString (s: String, toString: String = "pine") -> String
{
    return toString + s
}
let s2 = addAnotherString("apple", toString: "toffee-")
let s3 = addAnotherString("cone")



// ------------------------------------------
// Variadic Parameters
// ------------------------------------------

func sumOfInts(numbers: Int...) -> Int
{
    var tot = 0
    for i in numbers { tot += i }
    return tot
}

sumOfInts(2, 3)
sumOfInts(5, 9, 11, 13, 22)



// ------------------------------------------
// Function Types
// ------------------------------------------

var generalFunc: (Int) -> Int

func addOne (i: Int) -> Int { return i+1 }
func addTwo (i: Int) -> Int { return i+2 }
func times8 (i: Int) -> Int { return i * 8 }
generalFunc = addOne

addOne(4)      // returns 5
generalFunc(5) // returns 6
generalFunc = addTwo
generalFunc(5) // returns 7


func adaptable(inputFunc: (Int)->Int, _ p: Int) -> Int
{
    return inputFunc(p)
}

adaptable(addOne, 4)  // returns 5
adaptable(times8, 5)  // returns 40






