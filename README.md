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

- [ ] Day 5

  - QofTD: "To be or not to be, that is the question..." - Shakespeare’s Hamlet
  
  - Conditional Statements 
    - IF: `if condition { doSomething }`
    - IF/ELSE: `if condition { doSomething } else {doSomethingElse}`
    - IF/ELSE IF/IF: `if condition { doOneThing } else if {doAnotherThing} else {doWhatever}`
  - Comparison Operators:
     - Can be used for not just numbers but Strings, Date and Enums
    - `> : Greater Than`
    - `< : Less Than`
    - `>= : Greater Than or Equal To`
    - `<= : Less Than or Equal To`
    - `== : Equal To`
    - `!= : Not Equal To`
    - `data.isEmpty : true if empty`
      - Better to use isEmpty than `data.count == 0` or `data == ""` as it avoids going through each character and counting/comparing.
  - Logical Operators:
    - && : AND
    - || : OR
    - Use parentheses whenever combining multiple conditions to be specific of how you want the logic to be calculated

  - Switch statements
    - alternative way of writing multiple if statements
    - they need to be exhaustive, so either list all possible values or have a default at the end
    - unlike other languages, the case "breaks" the moment a case is matched
    - if you explicitly want Swift to continue through the cases, even after a match, use `fallthrough`
    - Example: 
    ```
      let day = 3
      print("My true love gave to me…")

      switch day {
      case 5:
          print("5 golden rings")
          fallthrough
      case 4:
          print("4 calling birds")
          fallthrough
      case 3:
          print("3 French hens")
          fallthrough
      case 2:
          print("2 turtle doves")
          fallthrough
      default:
          print("A partridge in a pear tree")
      }
    ```

  - Ternary Conditional Operator
    - as opposed to acting on two pieces of data (binary 2 + 5), ternary operators act on three pieces of data:
      - W: what we checking? the condition
      - T: what to do if condition is true? 
      - F: what to do if condition is false? 
      - e.g:  `let canVote = age >=18 ? "Yes" : "No"`)  
    - could be seen as a alternative way of if/else statement, becomes very useful in SwiftUI
    
