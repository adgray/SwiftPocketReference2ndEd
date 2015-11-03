// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Strings and Characters
// ---------------------------------------------------------------

var astring = "Hello"
var achar: Character = "A"
let dogface: Character = "\u{1f436}"

let newString = "Hello" + " Bill"

var welcome = "Hello"
welcome += " there"



// ------------------------------------------
// Strings Properties
// ------------------------------------------

astring.isEmpty
astring.characters
astring.characters.count

astring.lowercaseString
astring.uppercaseString

astring.utf8
astring.utf16
astring.unicodeScalars



// ------------------------------------------
// Comparing Strings
// ------------------------------------------

let name = "Fred"
astring == name
astring != name
astring < name
astring <= name
astring > name
astring >= name

astring.hasPrefix("He")
astring.hasSuffix("lo")

// string comparison via sorting
var strArr = ["zebra", "Billy", "albert", "bob", "äric", "aaron", "able", "Zero"]
strArr.sort()



// ------------------------------------------
// Escaped Characters in Strings
// ------------------------------------------

let escaped = "This is an\ninteresting \"string\" to show off \'escaping\'"
print (escaped)



// ------------------------------------------
// String Interpolation
// ------------------------------------------

let costOfMeal = 56.80
let advice = "Consider tipping around \(costOfMeal * 0.20)"

let a = "Hi"
let b = "there"
let c = "\(a) \(b)"

let valueAsString = String(52.56)



// ------------------------------------------
// Conversion of Strings to Numeric Types
// ------------------------------------------

let sInt = Int("45")
let sDouble = Double("23.2")!



// ------------------------------------------
// Character-level Acccess in Strings
// ------------------------------------------

let aWithUmlaut: Character = "a\u{308}"
var uString = "a\u{308}"

uString.characters.count
uString.utf8.count
uString.utf16.count
uString.unicodeScalars.count

var charIndx8 = uString.utf8.startIndex
uString.utf8[charIndx8++]
uString.utf8[charIndx8++]
uString.utf8[charIndx8++]

var charIndx16 = uString.utf16.startIndex
uString.utf16[charIndx16++]
uString.utf16[charIndx16++]

var charIndxUS = uString.unicodeScalars.startIndex
uString.unicodeScalars[charIndxUS++]
uString.unicodeScalars[charIndxUS++]



print ("\n-character-level access in strings")
var str = "Swift"
for i in str.characters {
    print (i)
}


print ("\n-accessing characters by index")
var idx = str.utf8.startIndex
while (idx != str.utf8.endIndex) {
    print (str.utf8[idx], terminator: ", ")
    idx = idx.successor()
}
print ("")

let sought = Character("Y")
if let foundAt = "New York".characters.indexOf(sought) {
    print (sought, "found at position", foundAt)
}


// ------------------------------------------
// Inherited Behaviour
// ------------------------------------------

astring.append(achar)
astring.append(dogface)
astring.appendContentsOf(newString)
astring.removeAll(keepCapacity: true)


var vowels = "aeiou"
let epos = vowels.startIndex.successor()
vowels.removeAtIndex(epos)
vowels

var city = "New York"
var s = city.characters.startIndex
var e = s.advancedBy(3)
city.removeRange(s...e)


vowels.reserveCapacity(256)


import Foundation
let message = "Hi there %name%, welcome to the party!"
let tag = "%name%"
let guest = "Lisa"
let greeting = message.stringByReplacingOccurrencesOfString(tag, withString: guest)




