//
//  ContentView.swift
//  WordScramble
//
//  Created by Iqrah Nadeem on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                Section{
                    Text("data")
                    Text("data")
                    Text("data")
                }header: {
                    Text("Section 1")
                }
                
                ForEach(0..<3){ num in
                    Text("data row number \(num+4)")
                }
            }.listStyle(.sidebar)
            
            Form{
                Text("data")
                Text("data")
                Text("data")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
