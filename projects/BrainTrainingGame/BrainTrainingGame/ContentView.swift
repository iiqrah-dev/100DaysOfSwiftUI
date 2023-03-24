//
//  ContentView.swift
//  BrainTrainingGame
//
//  Created by Iqrah Nadeem on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    let objects = ["rock", "paper", "scissors"]
    
    @State private var opponentChoiceIndex = Int.random(in: 0...2)
    @State private var winCondition = Bool.random()
    
    @State private var score = 0
    
    let maxRCount = 10
    @State private var roundCount = 1
    
    var body: some View {
        VStack {
            HStack{
                Text("\(roundCount)/\(maxRCount)")
                Text("Score: \(score)")
            }
            
            Text("Opponent chooses \(objects[opponentChoiceIndex])")
            
            Text("You should ") +
            Text(winCondition == true ? "win" : "lose")
            
            HStack{
                
                ForEach(0..<3){ objectIndex in
                    Button(){
                        objectTapped(objects[objectIndex])
                    }label: {
                        Text(objects[objectIndex])
                    }
                }
                
            }
            
        }

    }
    
    func objectTapped(_ userChoice: String){
        
        let opponentChoice = objects[opponentChoiceIndex]
        
        if opponentChoice == userChoice {
            print("Don't Draw")
        }
        
        else{
            if winCondition {
                if opponentChoice == "rock" {
                    if userChoice == "paper" {
                        score += 1
                    }
                    
                    else if userChoice == "scissors" {
                        score -= 1
                    }
                }
                
                else if opponentChoice == "paper" {
                    
                    if userChoice == "scissors" {
                        score += 1
                    }
                    
                    else if userChoice == "rock" {
                        score -= 1
                    }
                }
                
                else if opponentChoice == "scissors" {
                    
                    if userChoice == "rock" {
                        score += 1
                    }
                    
                    else if userChoice == "paper" {
                        score -= 1
                    }
                }
            }
            
            else{
                
                if opponentChoice == "rock" {
                    if userChoice == "paper" {
                        score -= 1
                    }
                    
                    else if userChoice == "scissors" {
                        score += 1
                    }
                }
                
                else if opponentChoice == "paper" {
                    
                    if userChoice == "scissors" {
                        score -= 1
                    }
                    
                    else if userChoice == "rock" {
                        score += 1
                    }
                }
                
                else if opponentChoice == "scissors" {
                    
                    if userChoice == "rock" {
                        score -= 1
                    }
                    
                    else if userChoice == "paper" {
                        score += 1
                    }
                }
                
            }
        }
        
        

        nextRound()
    }
    
    func nextRound(){
        opponentChoiceIndex = Int.random(in: 0...2)
        winCondition = Bool.random()
        roundCount += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
