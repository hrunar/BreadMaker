//: [Previous](@previous)

import Interstellar

struct Dough {
    
    let yield: Double
    var mixed = false
    var autolyseCompleted = false
    
    init(yield: Double) {
        self.yield = yield
    }
    
    mutating func mix() {
        self.mixed = true
    }
    
    mutating func autolyse() {
        self.autolyseCompleted = true
    }
}

struct Loaf {
    let weight: Double
    
    init(weight: Double) {
        self.weight = weight
    }
}

enum BakeError: ErrorType {
    case MixingError
    case AutolyseError
    case DivideError
}

struct BreadMaker {
    
    func makeBread(completion: Result<[Loaf]> -> Void) -> Void {
        print("Making bread")
        let dough = Dough(yield: 1700)
        Signal(dough)
            .flatMap(mix)
            .flatMap(autolyse)
            .flatMap(divide)
            .subscribe { result in
                completion(result)
        }
        
    }
    
    private func mix(var dough: Dough) -> Result<Dough> {
        print("Mix")
        dough.mix()
        return .Success(dough)
    }
    
    private func autolyse(var dough: Dough) -> Result<Dough> {
        print("Autolyse")
        dough.autolyse()
        return .Success(dough)
    }
    
    private func divide(dough: Dough) -> Result<[Loaf]> {
        print("Divide")
        let loaves = [Loaf(weight: dough.yield / 2), Loaf(weight: dough.yield / 2)]
        return .Success(loaves)
    }
    
}

BreadMaker().makeBread { result in
    switch result {
    case .Success:
        print("Yeah! Got bread: \(result.value!)")
        break
    case .Error:
        print("Error, no bread!!")
    }
}


//: [Next](@next)
