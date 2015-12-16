//: [Previous](@previous)

import UIKit

let image = UIImage(named: "sourdough.png")
/*: 
## The taste of bread
    Baking bread consists of a performing series of steps. 
    Each step is important for the end result and must be completed before the next step.
    A well-baked bread should have an open, golden crumb and a dark crisp crust.
    We want well-developed flavour and excellent keeping qualities (1 week? No problem).

### Implementation requirements
    Chained, asynchronous calls where any function may fail.
    If one step fails, we want to short-circuit the call chain and return with error
    But; We do NOT want to have to handle errors per function call
*/

//: [Next](@next)
