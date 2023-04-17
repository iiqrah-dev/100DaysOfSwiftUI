//
//  ContentView.swift
//  Animation
//
//  Created by Iqrah Nadeem on 14/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scaleAmount = 1.0
    @State private var animationAmount = 1.0
    
    var body: some View {
        HStack{
            Button("Click Me"){
                
                //            scaleAmount += 1
                
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            //        .scaleEffect(scaleAmount)
            //        .blur(radius: (scaleAmount - 1) * 3)
            ////        .animation(.default, value: scaleAmount)
            ////        .animation(.interpolatingSpring(stiffness: 100, damping: 1), value: scaleAmount)
            //        .animation(
            //            .easeInOut(duration: 2)
            ////            .repeatCount(3, autoreverses: true)
            ////            .repeatForever(autoreverses: true)
            //            .delay(1),
            //        value: scaleAmount)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(scaleAmount)
                    .opacity(2 - scaleAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: scaleAmount
                    )
            )
            
            Spacer()
            
            VStack {
                        Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)

                       
                        Spacer()
                        Button("Tap Me") {
                            animationAmount += 1
                        }
                        .padding(40)
                        .background(.red)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .scaleEffect(animationAmount)
                        .animation(.default, value: animationAmount)
                    }
            
        }
        .onAppear{
            scaleAmount = 2
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
