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

//: A loaf of bread. No mutating functions as yet, let's see if we can keep it that way
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

//: The signature changes to return an array of loaves
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
        return dough.mixed ? .Success(dough) : .Error(BakeError.MixingError)
    }
    
    private func autolyse(var dough: Dough) -> Result<Dough> {
        print("Autolyse")
        dough.autolyse()
        return dough.autolyseCompleted ? .Success(dough) : .Error(BakeError.AutolyseError)
    }
    
    private func divide(dough: Dough) -> Result<[Loaf]> {
        print("Divide")
        let loaves = [Loaf(weight: dough.yield / 2), Loaf(weight: dough.yield / 2)]
//: This cannot possibly go wrong
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
