// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// A Taste of Swift
// ---------------------------------------------------------------


// some raw data to process
var users = ["xavier", "ryan", "brenda", "james", "sarah"]
var ages = [32, 28, 24, 41, 19]


// add some extensions to the String type
extension String
{
    func leadingSpaces(width: Int) -> String
    {
        var s = String(self)
        for _ in s.characters.count..<width {
            s = " " + s
        }
        return s
    }
    
    func trailingSpaces (width: Int) -> String
    {
        var s = String(self)
        for _ in s.characters.count..<width {
            s = s + " "
        }
        return s
    }
}


// a dictionary to store merged input
var merged = [String: Int]()
var totalAge = 0.0

// merge the two arrays into a dictionary
for var i=0; i < ages.count; i++ {
    merged[users[i]] = ages[i]
}

// interate over the dictionary in sorted order
// and generate a report
for user in merged.keys.sort() {
    let age = merged[user]!
    totalAge += Double(age)
    let paddedUser = user.trailingSpaces(10)
    let paddedAge = "\(age)".leadingSpaces(3)
    print ("\(paddedUser) \(paddedAge)")
}

print (merged.count, "users")
print ("average age:", totalAge / Double(merged.count))


