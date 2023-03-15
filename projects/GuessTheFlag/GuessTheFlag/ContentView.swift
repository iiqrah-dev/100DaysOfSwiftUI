//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Iqrah Nadeem on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isScoreAlertShowing = false
    @State private var isGameOverAlertShowing = false
    
    @State private var answerTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var questionCount = 1
    
    let maxQCount = 8
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var scoreAlertShowing = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.mint, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30){
                
                Spacer()
                VStack {

                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                    Text("\(countries[correctAnswer])")
                        .font(.largeTitle.weight(.semibold))
                }.foregroundColor(.black)
                    .padding(.top)
                
                Text("\(questionCount)/\(maxQCount)")
                    .font(.subheadline.weight(.heavy))
                
                Spacer()
                
                VStack(spacing: 30){
                    ForEach(0..<3){ index in
                        Button(){
                            flagTapped(index)
                        }label: {
                            Image(countries[index])
                                .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                        }.padding(.bottom)
                     
                    }
                }
                
                Text("Score: \(score)")
                    .font(.largeTitle.weight(.semibold))
                Spacer()
            }
            .alert("Game Over", isPresented: $isGameOverAlertShowing){
                Button("Restart", action: newGame)
            }message: {
                Text("Final Score: \(score)")
            }
            
        }.alert(answerTitle, isPresented: $isScoreAlertShowing){
            Button("Continue"){
                if questionCount == maxQCount {
                    isGameOverAlertShowing = true
                }
                else{
                    nextQuestion()
                }
            }
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
        questionCount+=1
    }
    
    func newGame(){
        score = 0
        questionCount = 0
        nextQuestion()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
