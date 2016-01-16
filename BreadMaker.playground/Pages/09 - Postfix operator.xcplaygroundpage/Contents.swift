//: [Previous](@previous)

//: ### The postfix operator

postfix operator % {}
postfix func % (value: Double) -> Double {
    return value / 100
}

struct Dough {
    
    let yield: Double
    let hydration: Double
    
    var flour: Double {
        return 100 * yield / (100 + hydration)
    }
    
    var water: Double {
        return yield - flour
    }
    
    var yeast: Double {
        return flour * 1%
    }
    
    var salt: Double {
        return flour * 1.9%
    }
    
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
