//
//  ContentView.swift
//  WordScramble
//
//  Created by Iqrah Nadeem on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userTypedWords = [String]()
    @State private var originalWord = ""
    @State private var userTypedWord = ""
    
    var body: some View {
        NavigationView{
            
            List{
                Section {
                    TextField("Enter your word here", text: $userTypedWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section{
                    ForEach(userTypedWords, id: \.self){ word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(originalWord)
        }.onSubmit(addNewWord)
            .onAppear(perform: startGame)
    }
    
    func addNewWord(){
        
        let newWord = userTypedWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard newWord.count > 0 else { return }
        
        withAnimation {
            userTypedWords.insert(newWord, at: 0)
        }
        
        userTypedWord = ""
        
    }
    
    func startGame(){
        
        if let startTextFileURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWordsString = try? String(contentsOf: startTextFileURL){
                let startWords = startWordsString.components(separatedBy: "\n")
                
                originalWord = startWords.randomElement()!
                
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
        
    }
    
    func isWordNew(word: String) -> Bool {
        return !userTypedWords.contains(word)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
