//: [Previous](@previous)

struct Dough {
    
    let yield: Double
    let hydration: Double
    
    init(yield: Double, hydrationPercentage hydration: Double = 70.0) {
        self.yield = yield
        self.hydration = hydration
    }
}

let dough = Dough(yield: 1700)

//: How to calculate ingredient weights?
dough.flour

//: [Next](@next)
