//
//  ContentView.swift
//  EdutainmentApp
//
//  Created by Iqrah Nadeem on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tableNumber = 2
    
    private let questionLimitOptions = [5, 10, 20]
    @State private var questionCount = 1
    @State private var questionLimit = 5
    
    private let difficultyLevelOptions = ["easy", "hard", "extreme"]
    @State private var difficultyLevel = "easy"
    
    @State private var isAppInGameMode = true
    
    @State private var answer: Int = 0
    
    var body: some View {
        if isAppInGameMode {
            gameView
        }
        
        else{
            settingsView
        }
    }
    
    func startGame(){
        isAppInGameMode = true
    }
    
    var settingsView: some View{
        
        VStack {
            Stepper("Times table of \(tableNumber)", value: $tableNumber, in: 2...12, step: 1)
            
            Text("How many questions?").frame(maxWidth: .infinity, alignment: .leading)
            
            Picker("Question Limit Picker", selection: $questionLimit){
                ForEach(questionLimitOptions, id: \.self){
                    Text($0, format: .number)
                }
            }.pickerStyle(.segmented)
            
            Text("What difficulty level?").frame(maxWidth: .infinity, alignment: .leading)
            
            Picker("Difficulty Level Picker", selection: $difficultyLevel){
                ForEach(difficultyLevelOptions, id: \.self){
                    Text($0)
                }
            }.pickerStyle(.segmented)
            
            Button("Start"){
                startGame()
            }
        }
        
    }
    
    
    var gameView: some View{
        VStack{
            Text("Game View")
            
            Text("Lets practise times table of \(tableNumber)")
            
            HStack{
                Text("\(questionCount)/\(questionLimit)")
                Text("Mode: \(difficultyLevel)")
            }
            
            HStack{
                Text("What is")
                Text("\(Int.random(in: 0...5)) x \(tableNumber)")
                
            }
            
            Form{
                TextField("Answer", value: $answer, format: .number)


            }
            
            
            Button("Settings Menu"){
                isAppInGameMode = false
            }
        }
    }
}
                
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
