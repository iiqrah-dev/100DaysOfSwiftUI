//
//  ContentView.swift
//  Unit-Converter
//
//  Created by Iqrah Nadeem on 23/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue:Double?
    @State private var inputUnit:String = "cm"
    @State private var outputUnit:String = "km"
    
    let units = ["cm", "m", "km"]
    let cmConversion = ["cm": 1, "m": 100, "km": 100000]
    
    var resultValue: Double {
        if let inputValue = inputValue {
            if let inputConversionValue = cmConversion[inputUnit] {
                if let outputConversionValue = cmConversion[outputUnit] {
                    return (Double(inputConversionValue) * inputValue / Double(outputConversionValue))
                }
            }
        }
        return 0
    }
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    TextField("Enter value for conversion", value: $inputValue, format: .number)
                    Picker("Choose input unit", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Choose input values")
                }
                
                Section{
                    Picker("Choose output unit", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                } header: {
                    Text("Choose output unit")
                }

                Section{
                    Text(resultValue, format: .number)
                } header: {
                Text("Result")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
