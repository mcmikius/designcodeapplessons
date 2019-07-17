import UIKit

let myName = "Mykhailo"
var myAge = 31
myAge = 32

let myJob = "Software Engeneer"
let myYear = 1987
let isLearning = true
let myTwitter: String = "@mcmikius"
let label = "the width is"
let width = 100
let widthLabel = label + String(width)

var colors = ["red", "green", "blue"]
colors[0]
colors.append("orange")
colors.remove(at: 1)

if myAge > 30 {
    print("I'm old")
} else {
    print("I'm not old")
}

myAge > 30 ? "I'm old" : "I'm not old"

switch myAge {
case 30...100: print("I'm old")
    case 18...29: print("I'm an adult")
    case 0...17: print("I'm young")
default: print("I'm not sure")
}

for color in colors {
    print("this color is \(color)")
}

func pointToRetina(point: Int) -> Int {
    return point * 2
}

pointToRetina(point: 320)

struct UserStruct {
    var name: String
    var age: Int
    var job: String
}

var user = UserStruct(name: "Mykhailo", age: 32, job: "Engeneer")
user.name

class UserClass {
    var name: String
    var age: Int
    var job: String
    
    init(name: String, age: Int, job: String) {
        self.name = name
        self.age = age
        self.job = job
    }
}


