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
    
    @State private var errorAlertTitle = ""
    @State private var errorAlertMessage = ""
    @State private var iserrorAlertShowing = false
    
    var body: some View {
        NavigationView{
            
            
            VStack{
                
                Section{
                    Text("Score: ").frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal)
                }
                
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
                }.listStyle(.insetGrouped)
            }
            .navigationTitle(originalWord)
            .toolbar{
                Button("New Game"){
                    startGame()
                    userTypedWords = [String]()
                }
            }
        }.onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorAlertTitle, isPresented: $iserrorAlertShowing){
                Button("OK", role: .cancel){
                    userTypedWord = ""
                }
            }message: {
                Text(errorAlertMessage)
            }
    }
    
    func addNewWord(){
        
        let newWord = userTypedWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                
        guard newWord.count >= 3 else {
            wordError(title: "Word is too short", message: "Think of a word that is longer than 2 letters")
            return
        }
        
        guard newWord != originalWord else {
            wordError(title: "Be more original", message: "You can't use the same word that is given to you!")
            return
        }
        
        guard isWordPossible(newWord) else {
            
            wordError(title: "Word not possible", message: "You can't spell that word from '\(originalWord)'!")
            return
        }
        
        guard isWordNew(newWord) else {
            
            wordError(title: "Word used already", message: "Be more creative")
            return
        }
        
        guard isWordReal(newWord) else {
            
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
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
    
    func wordError(title: String, message: String){
        errorAlertTitle = title
        errorAlertMessage = message
        iserrorAlertShowing = true
    }
    
    func isWordNew(_ word: String) -> Bool {
        return !userTypedWords.contains(word)
    }
    
    func isWordPossible(_ word: String) -> Bool {
        var tempOriginalWord = originalWord
        
        for letter in word{
            
            if let letterPosition = tempOriginalWord.firstIndex(of: letter){
                tempOriginalWord.remove(at: letterPosition)
            }
            else {
                return false
            }
            
        }
        
        return true
    }
    
    
    func isWordReal(_ word: String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let realWordRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return realWordRange.location == NSNotFound
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
