// ---------------------------------------------------------------
// Swift Pocket Reference 2nd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Structures
// ---------------------------------------------------------------


// ------------------------------------------
// Methods in Structures
// ------------------------------------------

struct Rect1
{
    var x = 0.0, y = 0.0, width = 0.0, height = 0.0
    
    func area() -> Double
    {
        return (width * height)
    }
}



// ------------------------------------------
// Mutating Methods
// ------------------------------------------

struct Rect2
{
    var x = 0.0, y = 0.0, width = 0.0, height = 0.0
    
    mutating func embiggenBy(size: Double)
    {
        width += size
        height += size
    }
}



// ------------------------------------------
// Initializers in Structures
// ------------------------------------------

struct Rect3
{
    var x=0.0, y=0.0, width=0.0, height=0.0
}

var r3a = Rect3()
var r3b = Rect3(x:2.0, y:2.0, width:2.0, height:5.0)


struct Rect4
{
    var x=0.0, y=0.0, width=0.0, height=0.0
    
    init (x: Double, y: Double, side: Double)
    {
        self.x = x
        self.y = y
        self.width = side
        self.height = side
    }
}

var r4a = Rect4(x: 2.0, y: 2.0, side: 5.0)
r4a.width
r4a.height



// ------------------------------------------
// Initializer delegation in structures
// ------------------------------------------

struct Rect5
{
    var x, y, width, height: Double
    
    init(_ x: Double, _ y: Double,
        _ width: Double, _ height: Double)
    {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    init()
    {
        self.init(0.0, 0.0, 0.0, 0.0)
    }
    
}

var r5a = Rect5(0.0, 0.0, 3.0, 4.0)
var r5b = Rect5()





