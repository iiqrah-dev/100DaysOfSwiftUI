# 100DaysOfSwiftUI

[100DaysOfSwiftUI](https://www.hackingwithswift.com/100/swiftui) by [Paul Hudson](https://twitter.com/twostraws)

- [ ] Day 1

- QofTD 1: "The secret to getting ahead is getting started." - Mark Twain

- QofTD 2: "Programming is an art: don't spend all your time sharpening your pencil when you should be drawing."

  - Why Swift and SwiftUI? 
  
    - They are a relatively new language (est. 2014) and UI framework (est. 2019) that go hand in hand and leverage the capabilities of modern languages getting rid of the clunkiness that comes with old languages/framework.
    - Code is clear, safe and easy to write and understand.
 
 - Variables and constants:
 
    - `var myName = "Iqrah"` and `let myName = "Iqrah"`
    - Why do they exist? To store data in our programs: user typed, developer defined or downloaded from the internet ...
    - Prefer to use constants over variables to let Swift optimize your code and not let you change a constant’s value by accident.
    - type safe: so once declared with a certain data type, cannot be changed in next assignement
    
 - Strings:
    - text data surrounded by double quotes and case sensitive.
    - Use triple double quotes for multi-line strings.
    - useful methods:
      - `myName.count`
      - `myName.uppercased()`
      - `myName.hasPrefix("Iq")`
      
 - Numbers:
      
   - Integers:
      - whole number data that uses _ to separate large numbers.
      - useful methods:
        - number.isMultiple(of: 3)
    
  - Doubles (or CGFloat):
      - decimal numbers with "floating points", with capacity to store LARGE numbers with slightest of slightest inaccuracy (try: 0.1+0.2).
      - reason for complexity and inaccuracy is because computers store data in binary, so to store 1/3, very close approximations are needed.
      - Swift has type safty, so can't mix different types of numbers without type casting: Double(7) or Int(2.0)
      
 -  operators (that can also be used as compund assigned operators e.g number += 5):
    - `+ : Add`
    - `- : Subtract`
    - `* : Multiply`
    - `/ : Divide`

