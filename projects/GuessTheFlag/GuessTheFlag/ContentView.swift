//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Iqrah Nadeem on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
    }
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
