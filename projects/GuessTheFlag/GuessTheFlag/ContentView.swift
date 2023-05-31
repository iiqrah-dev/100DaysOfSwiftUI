//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Iqrah Nadeem on 28/02/2023.
//

import SwiftUI

struct FlagImage: View {
    
    // or
    //let flag: String
    
    private let flag: String
    
    init(flag: String) {
        self.flag = flag
    }
    
    var body: some View {
        Image(flag)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

class AlertContext: ObservableObject {
    
    var isActive = false
    var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive }, set: { self.isActive = $0 })
    }
    
    @Published var title: String = ""
    @Published var actions: () -> AnyView = { AnyView(erasing: EmptyView()) }
    
    init() {}
    
    func present(title: String, buttonTitle: String, buttonAction: @escaping () -> Void) {
        self.title = title
        self.actions = { AnyView(erasing: Button(buttonTitle, action: buttonAction)) }
        self.isActive = true
    }
}

extension View {
    func alert(_ context: AlertContext) -> some View {
        alert(context.title, isPresented: context.isActiveBinding, actions: context.actions)
    }
}

struct ContentView: View {
    
    @State private var isWrongAnswerAlertShowing = false
    @State private var isGameOverAlertShowing = false
    
    @State private var wrongAnswerMessage = ""
    @State private var score = 0
    @State private var questionCount = 1
    
    private let maxQCount = 8
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    private var scoreAlertShowing = false
    
    @ObservedObject private var alertContext = AlertContext()
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.mint, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Spacer()
                VStack {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                    Text("\(countries[correctAnswer])")
                        .font(.largeTitle.weight(.semibold))
                }
                .foregroundColor(.black)
                .padding(.top)
                
                Text("\(questionCount)/\(maxQCount)")
                    .font(.subheadline.weight(.heavy))
                
                Spacer()
                
                VStack(spacing: 30) { // why need spacing AND padding
                    ForEach(0..<3) { index in
                        FlagImage(flag: countries[index]).onTapGesture {
                            flagTapped(index)
                        }
                    }
                }
                
                Text("Score: \(score)")
                    .font(.largeTitle.weight(.semibold))
                Spacer()
            }
            .alert("Game Over", isPresented: $isGameOverAlertShowing) {
                Button("Restart", action: newGame)
            } message: {
                Text("Final Score: \(score)")
            }
            
        }
        .alert(alertContext)
//        .alert("Wrong", isPresented: $isWrongAnswerAlertShowing) {
//            Button("Continue", action: nextQuestion)
//        } message: {
//            Text(wrongAnswerMessage)
//        }
    }
    
    private func flagTapped(_ number: Int) {
        
        guard correctAnswer == number else {
            self.alertContext.present(title: "Wrong", buttonTitle: "Continue", buttonAction: nextQuestion)
            wrongAnswerMessage = "That is the flag of \(countries[number])"
            isWrongAnswerAlertShowing = true
            return
        }
        
        score += 1
        nextQuestion()
    }
    
    private func nextQuestion() {
        guard questionCount < maxQCount else {
            isGameOverAlertShowing = true
            return
        }
        
        withAnimation {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            questionCount+=1
        }
    }
    
    private func newGame() {
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
