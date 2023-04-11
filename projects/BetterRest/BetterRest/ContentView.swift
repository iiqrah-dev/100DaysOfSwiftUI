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
    
    @State private var date = Date.now

    var body: some View {
        Form {
            VStack {
                Text("Steppers")
                Stepper("\(stepValueINT)", value: $stepValueINT)
                
                Stepper("\(stepValueINT)", value: $stepValueINT, in: 0...100)
                
                Stepper("\(stepValueDBL.formatted()) hours", value: $stepValueDBL, in: 0...100, step: 0.25)
            }
            
            VStack{
                Text("Date Picker")
                
                DatePicker("Pick date and time", selection: $date)
                
                DatePicker("Pick a time", selection: $date)
                    .labelsHidden()
                
                DatePicker("Pick a time", selection: $date, displayedComponents: .hourAndMinute)
                
                DatePicker("Pick a date", selection: $date,in: Date.now..., displayedComponents: .date)
            }
            
            VStack(){
                Text("Display Dates")
                Text(Date.now, format: .dateTime.hour().minute())
                
                Text(Date.now.formatted(date: .long, time: .shortened))
            }
            .frame(maxWidth: .infinity, alignment: .center)

        }
    }
    
    func createDateComponent() {
        
        // How to create a specific components for a date
        var component = DateComponents()
        component.hour = 8
        component.minute = 0
        let createdDate = Calendar.current.date(from: component) ?? Date.now
        
        // How to extract specific components from a date
        let dateComponent = Calendar.current.dateComponents([.hour, .minute, .second], from: createdDate)
        let hour = dateComponent.hour ?? 0
        let minute = dateComponent.minute ?? 0
        let second = dateComponent.second ?? 0
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
