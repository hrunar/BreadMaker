//: [Previous](@previous)

import Interstellar

struct Dough {

    let yield: Double
    var mixed = false
    
    
    init(yield: Double) {
        self.yield = yield
    }
    
    mutating func mix() {
        self.mixed = true
    }
}

enum BakeError: ErrorType {
    case MixingError
}

struct BreadMaker {
    
    func makeBread(completion: Result<Dough> -> Void) -> Void {
        print("Making bread")
        let dough = Dough(yield: 1700)

/*: Making bread is a chain of (asynchronous) calls which may fail. Using a Signal lets us create this chain */
        Signal(dough)
            .flatMap(mix)
            .subscribe { result in
                completion(result)
        }
        
    }

    private func mix(var dough: Dough) -> Result<Dough> {
        print("Mix")
        dough.mix()
        return dough.mixed ? .Success(dough) : .Error(BakeError.MixingError)
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
