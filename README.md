# 100DaysOfSwiftUI

[100DaysOfSwiftUI](https://www.hackingwithswift.com/100/swiftui) by [Paul Hudson](https://twitter.com/twostraws)

- [x] Day 1

  - QofTD: "The secret to getting ahead is getting started." - Mark Twain

  - Why Swift and SwiftUI? 
  - Variables and Constants
  - Strings, Integers, Doubles
  
  
- [x] Day 2

  - QofTD: "When the going gets tough, everyone leaves." - Lynch’s Law
  
  - Booleans
  - Working with Strings
    - Concatenation 
    - Interpolation
  - [Checkpoint 1](https://github.com/iiqrah-dev/100DaysOfSwiftUI/tree/main/checkpoint-1.playground)
  
  
- [x] Day 3

  - QofTD: "Computers are like Old Testament gods: lots of rules and no mercy." - Joseph Campbell
  
  - Arrays [ value1, value2]     
  - Dictionaries [key1: value1, key2: value2]   
  - Sets ([value1, value2])
  - Enum {case value1, value2}

- [x] Day 4

  - QofTD: "Good data structures and bad code works a lot better than the other way around." - Eric Raymond
  
  - Type Annotations:
  - Simple Data Type Annotations
  - Group Data Type Annotations
  - [Checkpoint 2](https://github.com/iiqrah-dev/100DaysOfSwiftUI/tree/main/checkpoint-2.playground)    

- [x] Day 5

  - QofTD: "To be or not to be, that is the question..." - Shakespeare’s Hamlet
  
  - Conditional Statements 
  - Comparison Operators:
  - Logical Operators:
  - Switch statements
  - Ternary Conditional Operator
  
- [x] Day 6

  - QofTD: "It’s hardware that makes a machine fast, but it’s software that makes a fast machine slow." - Craig Bruce
  
  - For Loop
  - While Loop
  - Continue/Break
  - [Checkpoint 3](https://github.com/iiqrah-dev/100DaysOfSwiftUI/tree/main/checkpoint-3.playground)
  
- [ ] Day 7

  - QofTD: "Dennis Ritchie (the creator of the C programming language) encouraged modularity by telling all and sundry that function calls were really, really cheap in C. Everybody started writing small functions and modularizing. Years later we found out that function calls were still expensive, and our code was often spending 50% of its time just calling them. Dennis had lied to us! But it was too late; we were all hooked..." - Steve Johnson
  
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
  
  
  
