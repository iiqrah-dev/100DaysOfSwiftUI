//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Iqrah Nadeem on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isScoreAlertShowing = false
    @State private var answerTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var scoreAlertShowing = false
    
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of")
                    Text("\(countries[correctAnswer])")
                }.foregroundColor(.white)
                
                VStack(spacing: 30){
                    ForEach(0..<3){ index in
                        Button(){
                            flagTapped(index)
                        }label: {
                            Image(countries[index])
                        }
                    }
                }
            }
        }.alert(answerTitle, isPresented: $isScoreAlertShowing){
            Button("Continue", action: nextQuestion)
        }message: {
            Text(scoreMessage)
        }

    }
        
    func flagTapped(_ number: Int){
        
        if correctAnswer == number{
            answerTitle = "Correct!"
            score+=1
            scoreMessage = "Your scaore is \(score)"
        }
        else{
            answerTitle = "Wrong"
            scoreMessage = "Your scaore is \(score)\nThat is the flag of \(countries[number])"
        }
        
        isScoreAlertShowing = true
    }
    
    func nextQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
