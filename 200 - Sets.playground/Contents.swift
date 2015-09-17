// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Sets
// ---------------------------------------------------------------

var aSet = Set<Int>()
var compassPoints = Set<String>()
compassPoints = ["North", "South", "East", "West"]

var vowels = Set<Character>(minimumCapacity: 5)

var chessMaster: Set = ["King", "Queen", "Rook", "Bishop", "Knight", "Pawn"]
var chessPieces = chessMaster
var chessTemp = chessMaster

var fish: Set = ["Cod", "Flathead", "Shark"]
var mammals: Set = ["Dolphin", "Whale", "Dugong"]
var protected: Set = ["Shark", "Whale", "Dugong", "Dolphin"]




// -------------------------------------
// Comparing Sets
// -------------------------------------

chessPieces == chessMaster
fish == mammals
fish != mammals




// -------------------------------------
// Accessing Set Items and Properties
// -------------------------------------

chessPieces.contains("Prince")
chessPieces.contains("King")
chessPieces.count
chessPieces.isEmpty
vowels.isEmpty




// -------------------------------------
// Modifying a Mutable Set
// -------------------------------------

chessPieces.insert("King")


chessPieces.insert("Prince")
chessPieces.exclusiveOrInPlace(chessMaster)


chessPieces = chessMaster
chessPieces.intersectInPlace(["King", "Queen"])


chessPieces = chessMaster
chessPieces.remove("Pawn")
chessPieces.remove("undefinedPiece")


chessPieces = chessMaster
chessPieces.removeAll()
// with an empty set, the next line will cause a runtime 
// chessPieces.removeFirst()


chessPieces = chessMaster
let item = chessPieces.removeFirst()
chessPieces
chessPieces.insert(item)
chessPieces.removeFirst()
chessPieces


chessPieces.subtractInPlace(["Rook", "Pawn", "Queen"])


chessPieces.unionInPlace(["Rook", "Pawn", "Queen"])




// -------------------------------------
// Iterating Over Sets
// -------------------------------------

print ("\n-iterating over a set's elements")
for piece in chessPieces.sort().reverse() {
    print (piece)
}




// -------------------------------------
// Set Operations
// -------------------------------------

let allSeaCreatures = fish.union(mammals)
let unprotectedSeaCreatures = allSeaCreatures.exclusiveOr(protected)


let protectedMammals = mammals.intersect(protected)
let protectedFish = fish.intersect(protected)


fish.isDisjointWith(mammals) // should be true - fish aren't mammals


mammals.isStrictSubsetOf(protected) // should be true - all mammals should be protected


protected.isStrictSupersetOf(mammals) // should be true - mammals + others should be protected
protected.isStrictSupersetOf(fish) // should be false - not all fish are protected


mammals.isSubsetOf(protected) // should be true - mammals + others should be protected
fish.isSubsetOf(protected) // should be false - not all fish are protected
unprotectedSeaCreatures.isSubsetOf(fish) // should be true from earlier exor


allSeaCreatures.isSupersetOf(fish) // should be true from earlier union

protected.subtract(mammals) // should just leave protected fish




// -------------------------------------
// Inherited Behaviour
// -------------------------------------

var removed: String = ""
if let someIndex = chessPieces.indexOf("King")
{
    removed = chessPieces.removeAtIndex(someIndex)
}
chessPieces
removed

print ("\n-iterating over a set by index")
for var i in chessPieces.startIndex..<chessPieces.endIndex
{
    print (chessPieces[i])
}






