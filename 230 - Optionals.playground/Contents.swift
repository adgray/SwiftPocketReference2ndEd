// ------------------------------------------
// Swift Pocket Reference by Anthony Gray
// ------------------------------------------
// Optionals
// ---------------------------------------------------------------



var str: String?
var n: String?

// can assign optionals of the same type
n = str

// can't assign optional to non-optional
var r: String
// r = str // will fail due to type mismatch



// ------------------------------------------
// Unwrapping optionals
// ------------------------------------------

if str != nil   { // check if the optional has a value
    r = str!      // it does – unwrap it and copy it
} else {
    // the optional had no value
}



// ------------------------------------------
// Implicitly unwrapped optionals
// ------------------------------------------

let constantString: String! = "Hello"

var mutableString: String
mutableString = constantString
// constantSTring is implicitly unwrapped



// ------------------------------------------
// optional binding
// ------------------------------------------

var someOptional: String?
someOptional = "Swift"

func ifDemo()
{
    if let aConst = someOptional {
        print ("unwrapped version is:", aConst)
    } else {
        print ("optional was not unwrapped")
    }
    // aConst is now out of scope
}

func guardDemo()
{
    guard let aConst = someOptional else
    {
        print ("optional is nil")
        return
    }
    print ("unwrapped version is:", aConst)
    // aConst is still in scope
}

ifDemo()
guardDemo()

if let aConst = someOptional {
    print ("unwrapped, and condition met")
} else {
    print ("not unwrapped - either nil, or condition not met")
}




// ------------------------------------------
// compound optional binding
// ------------------------------------------

var optional1: String? = "Hi"
var optional2: String? = "Hello"

if let a = optional1, b = optional2 {
    print ("both optionals unwrapped")
}




// ------------------------------------------
// optional chaining
// ------------------------------------------

class A
{
    var otherClass: B?
}

class B
{
    var someProperty: Int = 7
    func someMethod()
    {
        print ("someMethod called!")
    }
    subscript (index: Int) -> String
        {
        get {
            print ("getter for [\(index)] called")
            return "sample string"
        }
        set { print ("setter for [\(index)] called") }
    }
}

// declare variable to store instances of A
var a: A?


// use optional chaining to interrogate deep property
if let p = a?.otherClass?.someProperty {
    print (p)
} else {
    print ("no property available")
}

if (a?.otherClass?.someProperty = 6) == nil {
    print ("failed to write chained property")
}

// make an instance of A, and B
a = A()
a?.otherClass = B()

// use optional chaining to access deep properties
a?.otherClass?[1]
a?.otherClass?[3] = "Optional chaining is neat"
a?.otherClass?[3]



