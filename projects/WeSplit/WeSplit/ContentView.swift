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
    
    @FocusState private var isBillAmountFocused: Bool
    
    let tipPercentOptions = [0, 5, 10, 15, 20, 25]
    
    var totalWithTip: Double {
        let tipAmount = (Double(tipPercentage)/100) * totalAmount
        let totalWithTip = totalAmount+tipAmount
        return totalWithTip
        
    }
    
    var totalPerPerson: Double {
        let people = Double(numberOfPeople + 2)
        let totalPerPerson = totalWithTip/people
        return totalPerPerson
    }
    
    var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "GBP")
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("Enter total bill amount? ", value: $totalAmount, format: currencyFormatter)
                        .focused($isBillAmountFocused)
                        .keyboardType(.decimalPad)
                    //                modifier to restrict keyboard to be only numbers
                    
                }header: {
                    Text("What is the total bill? 💸")
                }
                    
                    Section {
                        Picker("Choose ", selection: $numberOfPeople){
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }.pickerStyle(.menu)
                    }header: {
                        Text("How many people? 🤔")
                    }
                    
                    Section {
//                        Picker("Tip", selection: $tipPercentage){
//                            ForEach(tipPercentOptions, id: \.self){
//                                Text($0, format: .percent)
//                            }
//                        }.pickerStyle(.segmented)
                        
                        Picker("Tip", selection: $tipPercentage){
                            ForEach(0..<101){
                                Text($0, format: .percent)
                            }
                        }.pickerStyle(.menu)
                        
                    }header: {
                        Text("What % of tip do you choose? 💁‍♀️")
                    }
                    
                
            
            Section{
    //                + Adds multiple texts together
    //                Used this as I wanted the symbol instead of currency code String
                Text("Total amount including tip: ")
                + Text(totalWithTip, format: currencyFormatter )
                
                Text("Amount per person: ")
                + Text(totalPerPerson, format: currencyFormatter )
            }header: {
                Text("Calculated amount ⬇️")
            }
            }
            
            .navigationTitle("WeSplit App")
        }.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isBillAmountFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
