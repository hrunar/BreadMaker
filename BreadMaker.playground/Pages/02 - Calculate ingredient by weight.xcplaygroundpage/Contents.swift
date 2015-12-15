//: [Previous](@previous)

//: ## Dough

struct Dough {
    
    let yield: Double
    let hydration: Double
    
    init(yield: Double, hydrationPercentage hydration: Double = 70.0) {
        self.yield = yield
        self.hydration = hydration
    }
}

let dough = Dough(yield: 1700)

/*: 
    A dough of 1700 grams gives us two loaves of 850g each.
    But, how to calculate ingredient weights? 
*/

//: [Next](@next)
