// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Program Flow - Error Handling
// ---------------------------------------------------------------


// ------------------------------------------
// do-try-catch
// ------------------------------------------


enum InputError: ErrorType
{
    case notAnInt
    case notAFloat
}

func sumArrayOfStrInts(strs: [String]) throws -> Int
{
    var tot = 0
    for str in strs
    {
        guard let strAsInt = Int(str) else
        {
            throw InputError.notAnInt
        }
        tot += strAsInt
    }
    return tot
}


func showCatch(nums: [String])
{
    do
    {
        let result = try sumArrayOfStrInts(nums)
        print ("Sum of ints is", result)
    }
    catch InputError.notAnInt
    {
        print ("Input error: string not an integer literal")
    }
    catch
    {
        print ("Some other error occured")
    }
}

showCatch(["12", "24", "8", "17"])
showCatch(["3", "15", "5.4"])
showCatch(["3", "15", "6"])



// ------------------------------------------
// forced try
// ------------------------------------------

try! sumArrayOfStrInts(["12", "24", "8", "17"])
// try! sumArrayOfStrInts(["3", "0.4"]) // will give runtime error



// ------------------------------------------
// optional try
// ------------------------------------------

try? sumArrayOfStrInts(["12", "24", "8", "17"]) // returns 61
try? sumArrayOfStrInts(["3", "0.4"]) // returns nil




