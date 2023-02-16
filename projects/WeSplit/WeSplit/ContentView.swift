//
//  ContentView.swift
//  WeSplit
//
//  Created by Iqrah Nadeem on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentOptions = [0, 5, 10, 15, 20, 25]
    
    var totalPerperson: Double {
        let people = Double(numberOfPeople + 2)
        let tipAmount = (Double(tipPercentage)/100) * totalAmount
        
        let amountPerPerson = (totalAmount+tipAmount)/people
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("Enter total bill amount? ", value: $totalAmount, format: .currency(code: Locale.current.currency?.identifier ??  "GBP"))
                        .keyboardType(.decimalPad)
                    //                modifier to restrict keyboard to be only numbers
                    
                }header: {
                    Text("What is the total bill? ")
                }
                    
                    Section {
                        Picker("Choose ", selection: $numberOfPeople){
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }.pickerStyle(.menu)
                    }header: {
                        Text("How many people?")
                    }
                    
                    Section {
                        Picker("Tip", selection: $tipPercentage){
                            ForEach(tipPercentOptions, id: \.self){
                                Text($0, format: .percent)
                            }
                        }.pickerStyle(.segmented)
                    }header: {
                        Text("What % of tip do you choose?")
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
