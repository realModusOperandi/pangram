//
//  ContentView.swift
//  pangram
//
//  Created by Liam Westby on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var pangram = ""
    @State var missingLetters = 26
    @ObservedObject var letters = Letters()
    
    var body: some View {
        VStack {
            TextField("Type your sentence here", text: $pangram)
                .font(.system(size: 24))
                .padding(.bottom, 5)
                .onChange(of: pangram) { newValue in
                    updateLetters(newValue)
                }
            HStack {
                ForEach(0..<13) { index in
                    LetterView(letter: $letters.letters[index])
                }.fixedSize()
            }
            HStack {
                ForEach(13..<26) { index in
                    LetterView(letter: $letters.letters[index])
                }.fixedSize()
            }.padding(.bottom, 5)
            if (missingLetters == 0) {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text("Your sentence is a pangram!")
                        .italic()
                }.fixedSize()
            } else {
                Text("Your sentence needs \(missingLetters) more letters to be a pangram.")
                    .italic()
                    .fixedSize()
            }
            
        }
        .padding()
    }
    
    private func updateLetters(_ pangram: String) {
        var foundLetters = 0
        for i in 0..<letters.letters.count {
            let letter = letters.letters[i].name
            if pangram.uppercased().contains(letter) {
                letters.letters[i].present = true
                foundLetters += 1
            } else {
                letters.letters[i].present = false
            }
        }
        
        missingLetters = letters.letters.count - foundLetters
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

