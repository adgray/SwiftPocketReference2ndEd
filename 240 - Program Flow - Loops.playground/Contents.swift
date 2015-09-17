// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Program Flow - Loops
// ---------------------------------------------------------------


// ------------------------------------------
// for-condition-increment loops
// ------------------------------------------

print ("traditional for loop")
for var i=10; i<15; i++
{
    print (i)
}


print ("\nfor-in loop with range")
for i in 3...8
{
    print (i)
}


print ("\nfor-in loop with array")
var microprocessors = ["Z80", "6502", "i386"]
for i in microprocessors
{
    print (i)
}
// prints:
// Z80
// 6502
// i386


print ("\nfor-in loop with dictionary")
var vehicles = ["bike":2, "trike":3, "car":4, "lorry":18]
for (vehicle, wheels) in vehicles
{
    print (vehicle)
}
// prints:
// car
// lorry
// trike
// bike


print ("\nfor-in loop with where clause")
var out = ""
for i in 0...15 where (i % 3) != 0
{
    if (out != "") { out += ", " }
    out += String(i)
}
print (out)
// prints "1, 2, 4, 5, 7, 8, 10, 11, 13, 14"



// ------------------------------------------
// while loops
// ------------------------------------------
print ("\nwhile loop")
var count = 0
while (count < 10)
{
    print (count)
    count++
}


print ("\nrepeat-while loop")
var t = 0
repeat
{
    print (t)
    t++
} while (t < 10)



// ------------------------------------------
// early termination of loops
// ------------------------------------------
print ("\nearly termination of loops")
for i in 0...15
{
    if (i % 3) == 0 { continue }
    if i == 11 { break }
    print (i)
}

