//
//  BundleLearning.swift
//  WordScramble
//
//  Created by Iqrah Nadeem on 12/04/2023.
//

import Foundation

// Get URL from Bundle main for your file

//if let url = Bundle.main.url(forResource: "someFileName", withExtension: "txt"){
//
//    // Get contents of the file from that URL
//    if let content = try? String(contentsOf: url) {
//
//    }
//}

let alphabets = "a b c d e f g"
let alphaArray = alphabets.components(separatedBy: " ")

if let randomAlphabet = alphaArray.randomElement(){
    let trimmedAlphabet = randomAlphabet.trimmingCharacters(in: .whitespacesAndNewlines)
    print(trimmedAlphabet)
}

let randomLetter = alphaArray.randomElement()
let trimmed = randomLetter?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
print(trimmed)

// UITextChecker
// 1. Create a word and instance of UITextChecker()

let word = "appple"
let checker = UITextChecker()

// 2. Define the range for which the check needs to be done, the UIKit way (NSRange)
// utf-16 is charcater encoding, bridge between SwiftUI and UIKit way of storing letters in a string
let range = NSRange(location: 0, length: word.utf16.count)

// 3. Let the checker do its thing by mentioning all the parameters and find rangeOfMisspelledWord
let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
print(misspelledRange)
// 4. If rangeOfMisspelledWord.location comes back with NSNotFound, that means word is not misspelled
let misspelledResult = misspelledRange.location == NSNotFound
print(misspelledResult)
