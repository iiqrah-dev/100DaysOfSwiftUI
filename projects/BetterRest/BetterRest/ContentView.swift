//
//  ContentView.swift
//  BetterRest
//
//  Created by Iqrah Nadeem on 27/03/2023.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    @State private var wakeUpTime = Date.now
    @State private var sleepAmount = 6.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var sleepTimeAlertShowing = false
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
        }.alert(alertTitle, isPresented: $sleepTimeAlertShowing){
            Button("OK"){}
        }message: {
            Text(alertMessage)
        }
    }
    
    func calculateSleep(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let wakeUpTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
            
            let hour = wakeUpTimeComponents.hour ?? 0
            let minute = wakeUpTimeComponents.second ?? 0
            
            let totalTimeSeconds = (hour * 60 * 60) + (minute * 60)
            
            let prediction = try model.prediction(wake: Double(totalTimeSeconds)         , estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUpTime - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
            
        }
        catch{
            alertTitle = "Error"
            alertMessage = "Something went wrong, try again."
            
        }
        sleepTimeAlertShowing = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
