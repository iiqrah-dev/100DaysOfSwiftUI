# Day 9 - #100DaysOfSwiftUI

###  
  
  - Assign function to a variable `var newFunctionName = oldFunctionName` 
    - with () means run the function and store return value in variable
    - without () means copy the function itself and store it as a variable
    - Call "variable function" as newFunctionName() with arguments, no parameter name needed
    
  - Calling functions inside a fucntion
    - sorted() allows us to pass a function as its parameter to handle how the sorting should be done
    - `myArray.sorted(by: customSortingFunction)`
 
  - Closure:
    - uses the above two nuances to create annoynmous function that can be called from another function
    - stores functionality inside a variable without actually creating a "function"
    - starts and ends with {}
    - parameters and return type needs to be mentioned after opening first { and using `in` keyword
    - while calling, no parameter name needed, just pass the values directly
    
  - Trailing Closures
    - Lets us declutter closure syntax in scenarios where the parameter and return type is already known and not needed to be defined again
      - you could also go ahead an remove the function parameter name and (), simply just start writing clouse after the function 
      - `myArray.sorted { a, b in }`
      - you could also omit the closure parameter names and use $0, $1 etc instead, up to you!
    - Heavily used for SwiftUI!
    
  - Accepting functions as a parameter for a function
    - you could accept one or more functions in a function
    - [useful article on how closures are used as parameters](https://www.hackingwithswift.com/quick-start/understanding-swift/why-would-you-want-to-use-closures-as-parameters)
