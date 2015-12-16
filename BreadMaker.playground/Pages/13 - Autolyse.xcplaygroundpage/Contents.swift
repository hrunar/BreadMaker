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
}

struct BreadMaker {
    
    func makeBread(completion: Result<Dough> -> Void) -> Void {
        print("Making bread")
        let dough = Dough(yield: 1700)
        Signal(dough)
            .flatMap(mix)
            .subscribe { result in
                completion(result)
        }
        
    }
    
    private func mix(var dough: Dough) -> Result<Dough> {
        print("Mix")
//: If this returns an error, the chain is broken and error printed
        //return .Error(BakeError.MixingError)
//: Otherwise, return success
        dough.mix()
        return .Success(dough)
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
