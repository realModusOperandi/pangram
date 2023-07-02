//
//  ContentView.swift
//  pangram
//
//  Created by Liam Westby on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var pangram: String = ""
    @ObservedObject var letters = Letters()
    
    var body: some View {
        VStack {
            TextField("Type your sentence here", text: $pangram)
                .onChange(of: pangram) { newValue in
                    validate(newValue)
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
            }
        }
        .padding()
    }
    
    private func validate(_ pangram: String) {
        for i in 0..<letters.letters.count {
            let letter = letters.letters[i].name
            if pangram.uppercased().contains(letter) {
                letters.letters[i].present = true
            } else {
                letters.letters[i].present = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

