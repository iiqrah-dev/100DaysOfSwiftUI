//
//  ContentView.swift
//  WeSplit
//
//  Created by Iqrah Nadeem on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    
    let tipPercentOptions = [0, 5, 10, 15, 20, 25]
    
    var body: some View {
        Form{
            Section {
                TextField("What is the total bill amount? ", value: $totalAmount, format: .currency(code: Locale.current.currency?.identifier ??  "GBP"))
                    .keyboardType(.decimalPad)
                //                modifier to restrict keyboard to be only numbers
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
