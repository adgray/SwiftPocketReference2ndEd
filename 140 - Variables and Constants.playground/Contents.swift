// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Variables and Constants
// ---------------------------------------------------------------



// ------------------------------------------
// Declaration without assignment
// ------------------------------------------
var anInt: Int
var aStr: String
var aChar: Character



// ------------------------------------------
// Declaration with assignment
// ------------------------------------------

var anotherInt: Int = 45
var anotherStr: String = "Frodo"



// ------------------------------------------
// Declaration with type inferencing
// ------------------------------------------

var someInt = 45
var someDouble = 23.0, someStr = "Strings too"



// ------------------------------------------
// Constants
// ------------------------------------------

let constFloat: Float = 23.1
let constStr: String = "Bilbo"


let someConstFloat = 23.1
let someConstStr = "Bilbo"



// ------------------------------------------
// Overriding inferred type
// ------------------------------------------

let c: Character = "A"
// "A" is otherwise inferred to be a String

let f: Float = 3.14159
// 3.14149 is otherwise inferred to be a Double



// ------------------------------------------
// Keywords
// ------------------------------------------

//var func = 4       // not allowed – func is reserved
var `func` = 4       // allowed




// ------------------------------------------
// Computed Variables
// ------------------------------------------

var compInt: Int
{
    get {
        // code that computes and returns
        // a value of someType
        return 72
    }

    set(valueName) {
        // code that sets up conditions
        // using valueName
    }
}

compInt


var badPi: Float {
    return 22.0/7.0
}

let radius: Float = 1.5
let circumference = 2.0 * badPi * radius



// ------------------------------------------
// Variable Observers
// ------------------------------------------

var watcher: Int = 0 {
    willSet {
        print("watcher will be changed to", newValue)
    }
    didSet {
        print("watcher was changed from", oldValue)
        if ((watcher & 1) == 1) { watcher++ }
    }
}

watcher
watcher = 23
watcher


var onlyEven: Int = 0 {
    didSet {
        if ((onlyEven & 1) == 1) { onlyEven++ }
    }
}

onlyEven = 15
print (onlyEven)





