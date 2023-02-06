# Day 11 - #100DaysOfSwiftUI

###
  
- Access control
    - By default, Swift allows all prperties and methods be be accessed outside a struct, to control access: 
      - use `private` to allow access only inside the struct
      - use `fileprivate` to allow access only inside the file using the struct
      - use `public` to allow anyone, anyhwere to use it
      - use `private(set)` to allow anyone, anyhwere to read the property but only allow internal methods to write to this property
     - if using private access control for one or more properties in your struct, chances are you’ll need to create your own initializer 
- Static properties/methods
    - instead of associating certain properties/methods to an instance of a struct, when the property/method is associated to the struct itself, they are referred as static properties
    - created using `static` at the beginning, the methods won't need `mutating` keyword
    - you CANNOT call non-static properties/methods from static ones
    - you CAN call static properties/methods from non-satic ones
- `self` refers to current value of struct, `Self` refers to current type of struct 
