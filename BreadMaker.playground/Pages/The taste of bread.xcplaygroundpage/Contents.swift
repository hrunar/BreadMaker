//: [Previous](@previous)
import XCPlayground
//: ## The taste of bread - and a taste of the playground Timeline!

var risePeriod = 8.0 // hours

let yeastDoublingTime = 1.5 // hours

var yeastWeight = 50.0 // grams
var yeastWeight2 = 4.0 // grams

for var i = 0.0; i < risePeriod; i++ {
    yeastWeight += Double(i / yeastDoublingTime)
    yeastWeight2 += i / yeastDoublingTime
    
}




//: [Next](@next)
