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

//: The loaf represents bread in its different stages
struct Loaf {
    let weight: Double
    var shaped = false
    var proofed = false
    var baked = false
    
    init(weight: Double) {
        self.weight = weight
    }
    
    func shapedLoaf() -> Loaf {
        var loaf = self
/*: 
        This struct is a value type, so the new variable is a copy of self. 
        So the shaped loaf keeps self's weight.
*/
        loaf.shaped = true
        return loaf
    }
    
    func proofedLoaf() -> Loaf {
        var loaf = self
        loaf.proofed = true
        return loaf
    }
    
    func bakedLoaf() -> Loaf {
        var loaf = self
        loaf.baked = true
        return loaf
    }
}

enum BakeError: ErrorType {
    case MixingError
    case AutolyseError
    case DivideError
//: A few errors more
    case ShapeError
    case ProofError
    case BakeError
}

struct BreadMaker {
    
//: The signature changes to return an array of loaves
    func makeBread(completion: Result<[Loaf]> -> Void) -> Void {
        print("Making bread")
        let dough = Dough(yield: 1700)
//: The completed process
        Signal(dough)
            .flatMap(mix)
            .flatMap(autolyse)
            .flatMap(divide)
            .flatMap(shape)
            .flatMap(proof)
            .flatMap(bake)
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
        return dough.autolyseCompleted ? .Success(dough) : .Error(BakeError.AutolyseError)
    }
    
    private func divide(dough: Dough) -> Result<[Loaf]> {
        print("Divide")
        let loafWeight = dough.yield / 2
        let loaves = [Loaf(weight: loafWeight), Loaf(weight: loafWeight)]
        return .Success(loaves)
    }
    
//: These functions return success if every loaf has completed its respective step
    private func shape(loaves: [Loaf]) -> Result<[Loaf]> {
        print("Shape")
        let shapedLoaves = loaves.map({$0.shapedLoaf()})
//: We check for success by reducing the shaped-state of each loaf into a single Bool
        let success = shapedLoaves.reduce(true, combine: {$0 && $1.shaped})
        return success ? .Success(shapedLoaves) : .Error(BakeError.ShapeError)
    }
    
    private func proof(loaves: [Loaf]) -> Result<[Loaf]> {
        print("Proof")
        let proofedLoaves = loaves.map({$0.proofedLoaf()})
        let success = proofedLoaves.reduce(true, combine: {$0 && $1.proofed})
        return success ? .Success(proofedLoaves) : .Error(BakeError.ProofError)
    }
    
    private func bake(loaves: [Loaf]) -> Result<[Loaf]> {
        print("Bake")
        let bakedLoaves = loaves.map({$0.bakedLoaf()})
        let success = bakedLoaves.reduce(true, combine: {$0 && $1.baked})
        return success ? .Success(bakedLoaves) : .Error(BakeError.BakeError)
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
