//
//  ContentView.swift
//  BetterRest
//
//  Created by Iqrah Nadeem on 27/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var stepValueINT = 1
    @State private var stepValueDBL = 2.0

    var body: some View {
        VStack {
            Stepper("\(stepValueINT)", value: $stepValueINT)
            
            Stepper("\(stepValueINT)", value: $stepValueINT, in: 0...100)
            
            Stepper("\(stepValueDBL.formatted()) hours", value: $stepValueDBL, in: 0...100, step: 0.25)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
