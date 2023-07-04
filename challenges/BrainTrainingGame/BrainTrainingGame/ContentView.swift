//
//  ContentView.swift
//  BrainTrainingGame
//
//  Created by Iqrah Nadeem on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    enum Objects: String, CaseIterable {
        case rock
        case paper
        case scissors
    }
    
    private let objects = Objects.allCases
    
    @State private var opponentChoiceIndex = Int.random(in: 0...2)
    @State private var winCondition = Bool.random()
    
    @State private var isGameOverAlertShowing = false
    
    @State private var score = 0
    
    private let maxRCount = 10
    @State private var roundCount = 1
    
    private var opponentChoice: Objects {
        objects[opponentChoiceIndex]
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(roundCount)/\(maxRCount)")
                Text("Score: \(score)")
            }
            
            Text("Opponent chooses \(objects[opponentChoiceIndex].rawValue)")
            
            Text("You should ") +
            Text(winCondition == true ? "win" : "lose")
            
            HStack {
                ForEach(0..<3){ objectIndex in
                    Button(objects[objectIndex].rawValue) {
                        objectTapped(objects[objectIndex])
                    }
                }
            }.alert("Game Over", isPresented: $isGameOverAlertShowing) {
                Button("Restart", action: newGame)
            } message: {
                Text("Your final score is \(score)")
            }
        }
    }
    
    private func newGame() {
        score = 0
        roundCount = 0
        nextRound()
    }
    
    private func objectTapped(_ userChoice: Objects) {
        let didWin: Bool?
        switch (opponentChoice, userChoice) {
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            didWin = true
            
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            didWin = false
            
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            print("Don't Draw")
            didWin = nil
        }
        
        if let didWin {
            score += winCondition == didWin ? 1 : -1
            /*
             had_to_win | did_win
             true | true -> +1
             false | false -> +1
             
             true | false -> -1
             false | true -> -1
             */
        }

        nextRound()
    }
    
    private func nextRound() {
        if (roundCount == maxRCount) {
            isGameOverAlertShowing = true
        } else {
            roundCount += 1
        }
        opponentChoiceIndex = Int.random(in: 0...2)
        winCondition = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
