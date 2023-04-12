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
