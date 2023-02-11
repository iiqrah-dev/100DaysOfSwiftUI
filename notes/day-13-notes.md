# Day 13 - #100DaysOfSwiftUI

###

  - Protocols
    - contracts for our Swift code, we define the expectations and Swift makes sure they are adhered to
    - To create a protocol, use `protocol ProtocolName { // all property/methods blueprint without implementation}`
    - To use a protocol, use `dataStructure : ProtocolName`
    - To add multiple protocols sepatrate them using a `,`
    - To use subclass and protocols, parent class should be followed by protocols and all separated by `,`
    - Swift is sometimes refered as POP 'Protocol-oriented Programming Language'
    
  - Opaque return types
    - used for flexibility of return type as long as it conforms to given protocol
    - relieves us of figuring out what the return type should be, handled by Swift behind the scenes
    - e.g. `some Equatable`, will work as long as what we are returning is an Equatable but which type exact only Swift knows
    
 - Extensions
    - In theory can be written as global scope functions but extensions are better due to teh following reasons: 
      - code completion
      - code organisation 
      - internal access
    - They do not add new stored properties, only computed properties  
    - If you add a custom intiliser for a struct as an extension, the memberwise init is still available to use
    - Use `mutating` if you change the `self`
    - You can add extension to data types and protocols
      - Array : data type
      - Collection : protocol that arrays, sets, dictionaries adhere to
