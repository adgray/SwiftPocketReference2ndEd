// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Program Flow - Conditional
// ---------------------------------------------------------------


// ------------------------------------------
// if-else
// ------------------------------------------

print ("if-else examples")

var b1: Bool
var b2: Bool
b1 = false
b2 = false

if b1
{
    print ("condition met")
}
else
{
    print ("condition not met")
}



if b1
{
    print ("first condition met")
}
else if b2
{
    print ("first condition not met\n",
        "second condition met")
}
else
{
    print ("no conditions met")
}



// ------------------------------------------
// guard-else
// ------------------------------------------

print ("\nguard-else examples")
func someAction()
{
    guard b1 == true else
    {
        return // exit scope
    }
    // continue execution
    // ...
}


var input = ["45", "27", "Apple", "3"]

for str in input
{
    guard let ageAsInt = Int(str) else
    {
        // not an int, so ignore
        continue
    }
    print ("age:", ageAsInt)
}

//  the where clause
for str in input
{
    guard let ageAsInt = Int(str) where ageAsInt > 5 else
    {
        continue
    }
    print ("age-2:", ageAsInt)
}



// ------------------------------------------
// switch
// ------------------------------------------

print ("\nswitch examples")
var n = 3
switch n {
case 0:
    print ("none")
case 1:
    print ("unit")
case 2:
    print ("pair")
case 3:
    print ("trio")
default:
    print ("lots")
}


var a = "c"
switch a {
case "a", "e", "i", "o", "u":
    print("this letter is a vowel")
case "b", "d", "g", "k", "p", "t":
    print("this letter may be a plosive sound in "
        + "English")
    fallthrough
case "c", "f", "h", "j", "l", "m", "n", "q", "r", "s",
"v", "w", "x", "y", "z":
    print("this letter is a consonant")
default:
    print("this letter doesn't interest me")
}



// ------------------------------------------
// Matching ranges in a case clause
// ------------------------------------------

print ("\nmatching a range in a case claise")

var marbles = 600
switch marbles {
case 0:
    print("you've lost your marbles!")
case 1:
    print("I see you have a marble")
case 2...5:
    print("I see you have some marbles")
case 6...10:
    print("That's quite a handful of marbles!")
case 10...99:
    print("That's lots and lots of marbles")
default:
    print("Were marbles on sale?")
}


// ------------------------------------------
// Using tuples in a case clause
// ------------------------------------------

print ("\nusing tuples in a case clause")

var year = 9                 // 7-10
var gender: Character = "M"  // "M" or "F"
var weekday = "Fri"          // "Mon" through "Fri"

var record = (gender, year, weekday)

switch record {
case ("M", 7...8, "Mon"):
    print ("Sports: Cricket")
case ("F", 7...8, "Mon"):
    print ("Sports: Netball")
case ("M", 9...10, "Tue"):
    print ("Sports: Football")
case ("F", 9...10, "Tue"):
    print ("Sports: Softball")
case (_, 7...8, "Wed"):
    print ("Music")
case (_, 9...10, "Wed"):
    print ("Theater")
case (_, 7...10, "Thu"):
    print ("Sciences")
case (_, 7...10, "Fri"):
    print ("Humanities")
default:
    print("nothing scheduled or invalid input")
}
// outputs "Humanities"


// ------------------------------------------
// Value binding with tuples and ranges
// ------------------------------------------

print ("\nvalue binding in a case clause")

weekday = "Thu"
record = (gender, year, weekday)

switch record {
case ("M", 7...8, "Mon"):
    print ("Sports: Cricket")
case ("F", 7...8, "Mon"):
    print ("Sports: Netball")
case ("M", 9...10, "Tue"):
    print ("Sports: Football")
case ("F", 9...10, "Tue"):
    print ("Sports: Softball")
case (_, 7...8, "Wed"):
    print ("Music")
case (_, 9...10, "Wed"):
    print ("Theater")
case (_, let yr, "Thu"):
    print ("Sciences - customized for year \(yr)")
case (_, 7...10, "Fri"):
    print ("Humanities")
default:
    print("nothing scheduled or invalid input")
}



// ------------------------------------------
// The where qualifier
// ------------------------------------------

print ("\nthe where qualifier in a case clause")

year = 7
record = (gender, year, weekday)

switch record {
case ("M", 7...8, "Mon"):
    print ("Sports: Cricket")
case ("F", 7...8, "Mon"):
    print ("Sports: Netball")
case ("M", 9...10, "Tue"):
    print ("Sports: Football")
case ("F", 9...10, "Tue"):
    print ("Sports: Softball")
case (_, 7...8, "Wed"):
    print ("Music")
case (_, 9...10, "Wed"):
    print ("Theater")
case (_, 7, let day) where day.hasPrefix("T"):
    print ("Home Economics")
case (_, 7...10, "Fri"):
    print ("Humanities")
default:
    print("nothing scheduled or invalid input")
}




// ------------------------------------------
// Using switch with enumerations
// ------------------------------------------

print ("\nusing switch with enumerations")

enum TravelClass {
    case First, Business, Economy
}

var thisTicket = TravelClass.First

switch thisTicket {
case .First:
    print ("Cost is $800")
case .Business:
    print ("Cost is $550")
case .Economy:
    print ("Cost is $200")
}
// outputs "Cost is $800"




// ------------------------------------------
// Statement labels
// ------------------------------------------

print ("\nstatement labels")

outerloop: for var i=1; i<10; i++ {
    for var j=1; j<10; j++ {
        if ((i == 6) && ((i * j) >= 30))
        { continue outerloop }
        print (i * j)
    }
    print ("-")
}




// ------------------------------------------
// do scopes
// ------------------------------------------

do {
    print ("hi")
    var aa = 45
    print (aa)
}

//print (aa)  // aa is underfined





// ------------------------------------------
// deferred execution
// ------------------------------------------

print ("\ndeferred execution examples")
do {
    defer {
        print ("Goodbye")
    }
    print ("Hello")
}


for i in 0...4
{
    defer { print ("+++") }
    
    print (i)
}


