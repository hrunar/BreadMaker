//: Bread basics

let ingredients = ["Flour", "Water", "Yeast", "Salt"]

//: Baker's percentage

let bakersPercentages: [String : Double] =
    [  "Flour": 100.0,
       "Water": 70.0,
       "Yeast": 4.0,
       "Salt": 1.9 ]

//: Recipe for a batch of dough: Yield + Hydration. 
//: Pro tip #1: hydration has a default value

struct Dough {

    let yield: Double
    let hydration: Double
    
    init(yield: Double, hydrationPercentage hydration: Double = 70.0) {
        self.yield = yield
        self.hydration = hydration
    }
    
}

//: Create an instance of dough with default hydration

let dough = Dough(yield: 1700)

//: [Next](@next)
