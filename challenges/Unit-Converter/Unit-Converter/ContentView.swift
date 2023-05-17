//
//  ContentView.swift
//  Unit-Converter
//
//  Created by Iqrah Nadeem on 23/02/2023.
//

import SwiftUI

enum Unit: String, CaseIterable, Identifiable {
    
    var id: String {
        rawValue
    }
    
    case centimeter = "cm"
    case meter = "m"
    case kilometer = "km"
    
    var cmConversion: Double {
        switch self {
        case .centimeter:
            return 1
        case .meter:
            return 100
        case .kilometer:
            return 10_000
        }
    }
}

struct ContentView: View {
    
    @State private var inputValue: Double?
    @State private var inputUnit = Unit.centimeter
    @State private var outputUnit = Unit.kilometer
    
    private var resultValue: Double {
        guard
            let inputValue = inputValue
        else {
            return 0
        }
        
        let convertionRatio = inputUnit.cmConversion / outputUnit.cmConversion
        return inputValue * convertionRatio
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Enter value for conversion", value: $inputValue, format: .number)
                    Picker("Choose input unit", selection: $inputUnit) {
                        ForEach(Unit.allCases) {
                            Text($0.rawValue).tag($0)
                        }
                        
                        /*
                         Text("cm").tag(Unit.centimeter)
                         Text("m").tag(Unit.meter)
                         Text("km").tag(Unit.kilometer)
                         */
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Choose input values")
                }
                
                Section {
                    Picker("Choose output unit", selection: $outputUnit) {
                        ForEach(Unit.allCases) {
                            Text($0.rawValue).tag($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Choose output unit")
                }
                
                Section {
                    Text(resultValue, format: .number)
                } header: {
                    Text("Result")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
}
