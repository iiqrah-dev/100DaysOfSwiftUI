//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Iqrah Nadeem on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowing = false
    var body: some View {
        VStack {
            ZStack{
                VStack(spacing: 0){
                    Color.green
                    Color.indigo
                }
                    
                VStack(alignment:.center,  spacing: 30) {
                        Text("Hello, world!")
                        Text("This is inside a stack")
                    
                    HStack(alignment: .top, spacing: 70){
                        Text("Item 1")
                        Text("Item 2")
                    }
                    
                   
                    }
                .foregroundColor(.secondary)
                .background(.ultraThinMaterial)
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
                
                

            }.background(Color(red: 1, green: 0.8, blue: 0))
           
            HStack{
                Button("Alert Me", role: .destructive){
                    print("Tapped")
                    isShowing = true
                }.buttonStyle(.borderedProminent)
                    .tint(.mint)
                
                Button{
                    print("Tapped")
                }label: {
                    Label("Edit", systemImage: "pencil")
                        
                }
                
                Image(systemName: "pencil")
                    .renderingMode(.original)
            }
            

        }
        .alert("Alert Title", isPresented: $isShowing){
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        }message: {
            Text("Please read this.")
        }
    }
        
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
