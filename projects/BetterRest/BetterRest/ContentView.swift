//
//  ContentView.swift
//  BetterRest
//
//  Created by Iqrah Nadeem on 27/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUpTime = Date.now
    @State private var sleepAmount = 6.0
    @State private var coffeeAmount = 1
    var body: some View {
        NavigationView{
            
            VStack{
                Text("When do you want to wake up?")
                DatePicker("Enter Wake Up Time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 2...12, step: 0.25)
                
                Text("Daily coffee intake")
                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 0...24)
                
            }
            .font(.headline)
            .navigationTitle("Better Rest")
            .toolbar{
                Button("Calculate", action: calculateSleep
                )}
        }
    }
    
    func calculateSleep(){}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
