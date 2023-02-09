# Day 12 - #100DaysOfSwiftUI  
  
### “Code should read like sentences, which makes me think my classes should read like chapters. So the deinitializer goes at the end, it's the ~fin~ of the class!” - Anne Cahalan
  
  - Classes
    - They are similar to structs in the following ways:
      - name them as you please
      - have property, methods, access control 
      - create custom init
    - The following are class specific abilities:
      - inheritance: the ability to build upon functionality from existing classes
      - do not come with memberwise init
      - referencing: two copies of a class reference to the same class, instead of having two separate copies
        - if you would like two separate copies, create a copy method in the class and use that to copy instances 
      - when final copy of class is called, the class can be deinitilised 
      - variable properties in a class can be changed, even if the instance is a constant

 - In SwiftUI, structs are used for UI and classes are used for data handeling 
    
 - Inheritance
    - New classes based on existing classes that inherit the existing classes properties and methods and lets us build on top of it
    - to inherit: `class childClass: parentClass {}`
    - in order to customise inherited methods, the method should use `override` keyword before the method defnition in the child class
    - to disallow a class to be inherited from, use `final`, this class will be able to inherit from other classes but can't be inherited from

 - Initializers
    - Swift doesn't provide memberwise initializers for classes, so we always have to create them or give default values
    - if a child class has any custom initializers, it must always call the parent’s initializer after it has finished setting up its own properties, using `super.init(parentArgument : childArgument)`
    - if a child class doesn't have any custom initializers, there is no need for a child class init, while creating the instance, parent class init will be used

 - Deinitializers
    - use `deinit{}` to create and don't have any parameters or return data
    - automatically called when the last copy of an instance is destroyed
    - this is done behind the scenes by Swift using ARC (automatic reference counting)
