# Day 8 - #100DaysOfSwiftUI

###
  
  - Default Parameter Values
    - make complex functions easier to call, focusing on the important parts that do need to change 
    - e.g. `func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {}`
    
  - Handling Errors
    - follows three steps:
      - define the errors that might happen, an enum that conforms to `Error`
      - write function that works normal but also throws error, use `throws` keyword in the function definition
      - run and test function with errors, using a do, try, catch block
        - very rarely can use try! and avoid using do,catch
        - in the do block, always have to explicitly mention `try` for every error throwing function
    - Apple provides some error messages of their own that can be used in the catch block `catch{ print(error.localizedDescription) }`
