//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Iqrah Nadeem on 17/03/2023.
//

import SwiftUI

struct LargeBlueModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}

extension View {
    
    func blueAndLarge() -> some View {
        modifier(LargeBlueModifier())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
        .blueAndLarge()
//        .modifier(LargeBlueModifier())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
