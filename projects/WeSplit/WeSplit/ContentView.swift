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
        NavigationView {
            Form{
                Section {
                    TextField("What is the total bill amount? ", value: $totalAmount, format: .currency(code: Locale.current.currency?.identifier ??  "GBP"))
                        .keyboardType(.decimalPad)
                    //                modifier to restrict keyboard to be only numbers
                    
                    
                    Picker("How many people? ", selection: $numberOfPeople){
                        ForEach(1..<100){
                            Text("\($0) people")
                        }
                    }
                }
            
            Section{
    //                + Adds multiple texts together
    //                Used this as I wanted the symbol instead of currency code String
                Text("Bill Amount: ")
                + Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ??  "GBP") )
            }
            }
            
            .navigationTitle("WeSplit App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
