//: [Previous](@previous)

//: ## Water

struct Dough {
    
    let yield: Double
    let hydration: Double
    
    var flour: Double {
        get {
            return 100 * yield / (100 + hydration)
        }
    }
    
/*: Todo: Implement water */
    
    init(yield: Double, hydrationPercentage hydration: Double = 70.0) {
        self.yield = yield
        self.hydration = hydration
    }
}

let dough = Dough(yield: 1700)
dough.yield
dough.flour
dough.water

//: [Next](@next)


