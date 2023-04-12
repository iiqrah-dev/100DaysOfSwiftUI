//
//  ContentView.swift
//  WordScramble
//
//  Created by Iqrah Nadeem on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userTypedWords = [String]()
    @State private var originalWord = "Apple"
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
    }
    
    func addNewWord(){
        
        let newWord = userTypedWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard newWord.count > 0 else { return }
        
        withAnimation {
            userTypedWords.insert(newWord, at: 0)
        }
        
        userTypedWord = ""
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
