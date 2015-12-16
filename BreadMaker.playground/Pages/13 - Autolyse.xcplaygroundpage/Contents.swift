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

enum BakeError: ErrorType {
    case MixingError
    case AutolyseError
}

struct BreadMaker {
    
    func makeBread(completion: Result<Dough> -> Void) -> Void {
        print("Making bread")
        let dough = Dough(yield: 1700)
        
//: Then we add the rest of the steps 
        
        Signal(dough)
            .flatMap(mix)
            .flatMap(autolyse)
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
    
}

BreadMaker().makeBread { result in
    switch result {
    case .Success:
        print("Got bread!")
        break
    case .Error:
        print("Error, no bread!!")
    }
}


//: [Next](@next)
