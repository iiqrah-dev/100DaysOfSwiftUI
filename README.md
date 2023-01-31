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
  
- [x] Day 7

  - QofTD: "Dennis Ritchie (the creator of the C programming language) encouraged modularity by telling all and sundry that function calls were really, really cheap in C. Everybody started writing small functions and modularizing. Years later we found out that function calls were still expensive, and our code was often spending 50% of its time just calling them. Dennis had lied to us! But it was too late; we were all hooked..." - Steve Johnson
  
  - Functions
  - Return Statements
  - Return Multiple Values
  - Parameters
  
- [x] Day 8

  - QofTD: "Life is what happens when you’re busy making other plans." - John Lennon
  
  - Default Parameter Values
  - Handling Errors
  - [Checkpoint 4](https://github.com/iiqrah-dev/100DaysOfSwiftUI/tree/main/checkpoint-4.playground)
  
- [x] Day 9

  - QofTD: "You can't expect to hit the jackpot if you don't put a few nickels in the machine." - Flip Wilson
  
  - Assign function to a variable `var newFunctionName = oldFunctionName` 
  - Calling functions inside a fucntion
  - Closure:
  - Trailing Closures
  - Accepting functions as a parameter for a function
  - [Checkpoint 5](https://github.com/iiqrah-dev/100DaysOfSwiftUI/tree/main/checkpoint-5.playground)

- [ ] Day 10

  - QofTD: "The programmer at wit’s end... can often do best by disentangling themself from their code, rearing back, and contemplating their data. Representation is the essence of programming." - Fred Brooks
  
  - Structs
    - developer defined custom complex data types with variables and functions.
      - variables, constansts inside a struct are called properties 
      - functions inside a struct are called methods
     
    - if you create an instance of a struct as a variable using `var`, you can change the contents using an internal function, but have to use the keyword `mutating` at the start of the function
    - if you create an instance of a struct as a constant using `let`, you won't be able to change the contents of it, even from an internal mutating function

    - the first time you create an instance, you are initilaising the instance of a struct with all the property names, the syntax looks like a function call because it is, Swift behind the scenes is calling an init() function on the struct 
    
    - Difference between a tuple and a struct
      -  Tuples are kind of like structs but without a name, but the main difference lies in the usage:
        - having multiple functions use a custom data type - easier to make an instance of that data type and call that in every function, rather than mention all property and values for every finction call
        - adding new properties to a complex data type - easier with structs, very hard and error prone with tuples
        - tuples are better for returning two or more arbitrary pieces of values from a function
        - structs are better for capturing fixed data that is sent or received multiple times
        
    - Computed property values
      - create a property as usual but instead of assigning a static stored value, use {} and define the logic to figure the value dynamically
      - Computed properties must always have an explicit type defined and never be constants
      - in order to read and write to this property, use `get{}` (to read) and `set{}` (to write)
        - set{} function comes with `newValue` to be used to make the required modifications 
   

- [ ] Day 16

  - QofTD: "be willing to be a beginner every single morning." - Meister Eckhart
  
  - New Xcode project set-up
  - Creating a form Form {}
    - scrolling lists of data
    - can exist upto 10 views inside, to add more use `Group {} ` or `Section {}`
    
  
  
  
  
