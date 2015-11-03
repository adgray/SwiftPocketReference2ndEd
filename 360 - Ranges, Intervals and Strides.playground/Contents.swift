// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Ranges, Intervals and Strides
// ---------------------------------------------------------------


// ------------------------------------------
// Ranges
// ------------------------------------------

var r = 1...5
r
// returns "1..<6"
r.startIndex
// returns 1
r.endIndex
// returns 6

print ("range output demonstration")
for x in r {
    print (x, terminator: ", ")
}
// prints:
// 1, 2, 3, 4, 5,



// ------------------------------------------
// Intervals
// ------------------------------------------

var i = 1.0...2.0

i.start    // returns 1.0
i.end      // returns 2.0
i.isEmpty  // returns false

// contains
i.contains(3.4) // returns false
i.contains(1.6) // returns true

// clamping
let c = i.clamp(1.5...2.5) // 1.5...2.0
let d = i.clamp(0.1...0.2) // 1.0...1.0
let e = i.clamp(3.0...4.0) // 2.0...2.0

// overlaps
i.overlaps(1.2...1.4) // true
i.overlaps(2.0...3.0) // true
i.overlaps(4.0...5.0) // false

// force-creating integer intervals (as opposed to ranges)
let j = HalfOpenInterval(2..<3)
let k: ClosedInterval = 4...14




// ------------------------------------------
// strides
// ------------------------------------------

var s = 2.stride(to:8, by:2)

print ("\nexclusive stride output demonstration")
for x in s
{
    print (x)
}
// outputs
// 2
// 4
// 6

let pp = 2.2.stride(through:2.8, by:0.3)

print ("\ninclusive stride output demonstration")
for x in 2.2.stride(through:2.8, by:0.3) {
    print (x)
}
// outputs
// 2.2
// 2.5
// 2.8



