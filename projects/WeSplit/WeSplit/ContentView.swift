//
//  ContentView.swift
//  WeSplit
//
//  Created by Iqrah Nadeem on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    
//    struct computed properties cannot be mutating, so a property wrapper @State is used instead
    @State var tapCount:Int = 0
    @State var name:String = ""
    
    var colours = ["black", "pink", "yellow", "orange"]
    @State var selectedColour = "pink"
    
    var body: some View {
//        Navigation View takes back one view, hence everything wrapped up in a VStack
        NavigationView {
            VStack{
                
                Button("Tap me"){
                    tapCount+=1
                }
                
                Text("Tap count: \(tapCount)")
                
             
                
                
                Form{
                    
                    Section{
                        Picker("Picker Title", selection: $selectedColour){
//                            \.self exists so that SwiftUI can identify every view on the screen uniquely
                            ForEach(colours, id: \.self) {
                                Text($0)
                            }
                            
                        }
                    }
                    
                    
                    Group{
//                        $ refers to two way binding, so value is read but also written into
                        TextField("Type your name", text: $name)
                        Text("Hello, \(name)!")
                    }
                    
                    Section{
//                        ForEach expects a range rather than closed range
                        ForEach(0..<5){ number in
                            Text("Row \(number)")
                            
                        }
                        
//                        Shorthand syntax for closure parameter
                        ForEach(5..<10){
                            Text("Row \($0)")
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("Navigation")
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
