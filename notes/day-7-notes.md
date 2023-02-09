# Day 7 - #100DaysOfSwiftUI

###
  
  - Functions
  
    - reusable piece of code that lets use use paramateres/arguments to make it customaisable
    - helps to make your code more modular
    - we can build new functions using existing functions, aka function composition
    - while deciding on how many parameters a function can take, maybe rely on "code smell" 
      - sensing that something about the code structure suggests an underlying problem
    - parameter : placeholder vs argument : actual value
    
  - Return Statements
    - the `return` keyword can be skipped from a function, if there is only one expression (not statemnets, loops, etc) in our function, useful in SwiftUI
      - when code can be boiled down to a single value -> expression
      - when performing actions such as creating variables, starting a loop, or checking a condition -> statement
      
    - Practice Exercise:
    ```
    //do two strings contain the same letters, regardless of their order?
    // This function should accept two string parameters, and return true if their letters are the same

    func areLettersIdentical(string1 : String, string2: String) -> Bool {
        (String(string1.lowercased().sorted()) == String(string2.lowercased().sorted()))
    }

    print(areLettersIdentical(string1: "ABC", string2: "cab"))
    ```
    
 - Return Multiple Values
    - you can use arrays, dictionaries, but better way is using tuples, e.g. `func multValues () -> (first: String, second: String) { (first: "value1", second: "value2")}`
    - you can destructure a tuple while calling the function:
    ```
    let (firstName, _) = multValues()
    print(firstName)
    ```
  
- Parameters 
  - can have same function with different parameter to do different tasks
  - can have different external and internal parameter name
  - use _ as external parameter name to not use it while calling functions
  
  
  
