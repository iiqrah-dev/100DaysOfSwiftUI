# Day 10 - #100DaysOfSwiftUI

###
  
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
        
  - Property Observers
    - `didSet{}` : run when the property just changed, access to special auto variable `newValue`
    - `willSet{}` : run before the property changes, access to special auto variable `oldValue`
    - try to avoid putting too much work into property observers to avoid performance issues
    
  - Custom initilsers
    - All properties must have a value by the time the initializer ends
    - Possible to call methods but only after assigning values to all the properties
    - use `self.propertyName` to be explicit of the usuage of property and parameter with the same name inside a custom initializer
    - When a custom initializer is added, the default memberwise initializer provided by Swift goes away
      - to include both, the custom initializer needs to be moved to an extension
