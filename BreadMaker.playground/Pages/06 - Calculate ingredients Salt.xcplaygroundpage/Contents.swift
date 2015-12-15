//: [Previous](@previous)

//: ## Yeast

struct Dough {
    
    let yield: Double
    let hydration: Double
    
    var flour: Double {
        get {
            return 100 * yield / (100 + hydration)
        }
    }
    
    var water: Double {
        get {
            return yield - flour
        }
    }
    
    var yeast: Double {
        get {
            return flour * 4 / 100
        }
    }
    
    // TODO: Implement salt (1.9%)
    
    init(yield: Double, hydrationPercentage hydration: Double = 70.0) {
        self.yield = yield
        self.hydration = hydration
    }
    
}

let dough = Dough(yield: 1700)
dough.yield
dough.flour
dough.water
dough.yeast
dough.salt

//: [Next](@next)
