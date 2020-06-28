import UIKit

// instance methods

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 6)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0

//-------------------------------------------------------------------------------------------------//

// The self property

//struct Point {
//    var x = 0.0, y = 0.0
//    func isToTheRightOf(x: Double) -> Bool {
//        return self.x > x
//    }
//}
//
//let somePoint = Point(x: 4.0, y: 5.0)
//if somePoint.isToTheRightOf(x: 1.0) {
//    print("The point is to the right of the line where x == 1.0")
//}

//-------------------------------------------------------------------------------------------------//

// Modifying Value types within instance methods

//struct Point {
//    var x = 0.0, y = 0.0
//    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
//}
//
//var somePoint = Point(x: 1.0, y: 1.0)
//somePoint.moveBy(x: 2.0, y: 3.0)
//print("The point is now at (\(somePoint.x), \(somePoint.y))")

//-------------------------------------------------------------------------------------------------//

// Assigning to self within a mutating method

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x+deltaX, y: y+deltaY)
    }
}

// mutating methods for enum

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to high
ovenLight.next()
// ovenLight is now equal to off

//-------------------------------------------------------------------------------------------------//

// Type Methods

class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

//
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
}
