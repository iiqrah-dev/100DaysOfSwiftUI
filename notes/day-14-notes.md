# Day 14 - #100DaysOfSwiftUI

###

  - Optionals
    - For data that might be present (data) or might not be (nil), denoted as `?` such as `let name: String? = nil`
    - To use optional data, we first need to unwrap it using one of the following techniques:
      - `if let unwrappedName = name {print(unwrappedName)}` else {print("Name does not exist")}
      - `gaurd let number = number else{print("Number does not exist" return)}`
      - Nil coalescing denoted as `??`
  - Nil coalescing: let us provide default vale incase optional contains nil 
    - similar to default value for dictionary key calls but can be used with all data types
    - however nil coalescing by mixing different data types is not allowed
    - `let name : String? = names[0] ?? "Does not exist"`
    - chaining nil coalescing is also possible `let savedData = first() ?? second() ?? ""`
  - Optional try?
    - we use try? to see if the function will work, if not returns nil without telling us what the error is
    - useful in three scenarios: 
      - in combination with `guard let` to exit the current function
      - in combination with nil coalescing
      - when calling any throwing function without a return value
