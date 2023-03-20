# Views and Modifiers - #100DaysOfSwiftUI

###  
  
  ## Why does SwiftUI use structs for views?
  - UIKit or AppKit uses classes whereas SwiftUI uses structs
  - Structs are simpler and faster
  - They are exactly what they are, instead of unnecesary hierarchical stuff that is not needed
  
  ## What is behind the main SwiftUI view?
  - Easier to think that there is nothing behind the SwiftUI view, it is all we have
  - Need to modify the SwiftUI view itself to get expected behaviour 


  ## Why does modifier order matter?
  - Everytime you add a modifier, a new struct is built accordingly
  - Can be thought as view is rendered after every modifier, rather than all modifiers being applied and then the view being rendered
  - Button with modifier colour -> frame will render button with a red color and then a frame dimension for the button
  - Button with modifier frame -> color will render button with frame dimension, and then fill red to that

  ## Why does SwiftUI use “some View” for its view type?
  - SwiftUI relies very heavily on a Swift power feature called “opaque return types”
  - Returning some View means even though we don’t know what view type is going back, the compiler does.
  - And 'View' itself is a big hole that must be filled as it is an associated type itself, by using some View, we let Swift detrmine how to fill that hole
  - if you create a VStack with two text views inside, 
    - SwiftUI silently creates a TupleView to contain those two views inside it
      - there is a version of TupleView that tracks ten different kinds of content, which also expalins why can a view only have 10 children at max
    - Swift also silently applies a special attribute to the body property called @ViewBuilder, so that even though it looks like we’re sending back multiple views, they get combined into one TupleView


  ## How to use conditional modifiers in SwiftUI?
  - Easiest way to apply a conditional modifier in SwiftUi is using a terenary operator
  - Even though this can be achieved using if/else statements, creates more work for SwiftUI, as it has to keep destroying and creating that View and modifier with change, rather than just update the modifier
  - Sometimes using if statements are unavoidable, but where possible prefer to use the ternary operator instead
  - `.foregroundColor(useRedText ? .red : .blue)`

  ## What are environemnt modifiers?
  - A modifier attached to a container so that it applies to all its children views
  - Basically the same as regular modifiers but if any of those child views override the same modifier, the child’s version takes priority
  - There is no way of knowing ahead of time which modifiers is which other than reading the individual documentation for each modifier and hope it’s mentioned


  ## How can Views be created as properties?
  - Helps to keep body property code clearer
    - `let motto1 = Text("Draco dormiens")`
  - Swift doesn’t let us create one stored property that refers to other stored properties
    - Swift does allow computed properties to be used
    - but unlike the body property, Swift won’t automatically apply the @ViewBuilder attribute here
    - if you want to send multiple views back through a separate computed property, there are three options:
      - Place them in a stack
      - Place them in a Group
      - Add the @ViewBuilder attribute manually
        - `@ViewBuilder var spells: some View { // Views }`
      - It is also possible to break a complex view into multiple smaller views without affecting performance
  
     ```
     struct CapsuleText: View {
     var text: String

     var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
      }
    }
    
    struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }
      }
    }
    ```
    
  ## How to create custome modifiers?
  - create a new struct that conforms to the ViewModifier protocol which has two requirements
    - a method called body that accepts whatever content it’s being given to work with
    - it much return some View
  - then use modifier() modifier to use your custome modifer `.modifier(Title())`
  - You could also use extension to make the usage a bit easier `.titleStyle()`
   
