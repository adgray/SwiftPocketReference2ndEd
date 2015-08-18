// ------------------------------------------
// Strings and Characters
// ------------------------------------------

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



// ------------------------------------------
// Character-level Acccess in Strings
// ------------------------------------------

let aWithUmlaut: Character = "a\u{308}"
var uString = "a\u{308}"

uString.characters.count
uString.utf8.count
uString.utf16.count
uString.unicodeScalars.count


var str = "Swift"
for i in str.characters
{
    print (i)
}


var idx = str.utf8.startIndex
while (idx != str.utf8.endIndex)
{
    print (str.utf8[idx])
    idx = idx.successor()
}



// ------------------------------------------
// Inherited Behaviour
// ------------------------------------------

astring.append(achar)
astring.append(dogface)
astring.extend(newString)

let separator = "+++"
var joined = separator.join(["fred", "bill", "mary"])
"+".join(["a", "b", "c"])

joined.removeAll(keepCapacity: true)

var vowels = "aeiou"
let epos = vowels.startIndex.successor()
vowels.removeAtIndex(epos)
vowels

vowels.reserveCapacity(256)


import Foundation
let message = "Hi there %name%, welcome to the party!"
let tag = "%name%"
let guest = "Lisa"
let greeting = message.stringByReplacingOccurrencesOfString(tag, withString: guest)





