//
//  ContentView.swift
//  BetterRest
//
//  Created by Iqrah Nadeem on 27/03/2023.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    private static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 30
        
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var wakeUpTime = defaultWakeUpTime
    @State private var sleepAmount = 6.0
    @State private var coffeeAmount = 3
    
    private var calculatedSleepTime: String {
        calculateSleep()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Enter Wake Up Time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                } header: {
                    Text("When do you want to wake up?")
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 2...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                }
                
                Section {
                    Picker("Number of coffee cups", selection: $coffeeAmount) {
                        ForEach(0..<25) { num in
                            Text(num == 1 ? "1 cup" : "\(num) cups")
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                }
                
                Section {
                    Text(calculatedSleepTime)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.indigo)
                } header: {
                    Text("Your ideal bedtime is: ")
                }
            }.font(.headline)
            .navigationTitle("Better Rest")
        }
    }
    
    private func calculateSleep() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let wakeUpTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
            
            let hour = wakeUpTimeComponents.hour ?? 0
            let minute = wakeUpTimeComponents.second ?? 0
            
            let totalTimeSeconds = (hour * 60 * 60) + (minute * 60)
            
            let prediction = try model.prediction(wake: Double(totalTimeSeconds)         , estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = (wakeUpTime - prediction.actualSleep).formatted(date: .omitted, time: .shortened)
            
            return sleepTime
        }
        catch { return "Calculation Error"}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
