//: [Previous](@previous)

//: ### Flour

struct Dough {
    
    let yield: Double
    let hydration: Double

/*: 
    Flour is a dynamic variable, calculated from the yield and hydration properties.
    Yield = flour + water, but since hydration is a percentage of the flour weight, we get
    Yield = flour + (flour * hydration / 100)
*/
    var flour: Double {
        return 100 * yield / (100 + hydration)
    }
    
    
    init(yield: Double, hydrationPercentage hydration: Double = 70.0) {
        self.yield = yield
        self.hydration = hydration
//: flour is a read-only variable, trying to set it produces an error
        self.flour = 1000.0
    }
}

let dough = Dough(yield: 1700)
dough.yield
dough.flour

//: [Next](@next)
