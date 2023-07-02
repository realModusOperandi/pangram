//
//  ContentView.swift
//  pangram
//
//  Created by Liam Westby on 7/2/23.
//

import SwiftUI

struct Letter: Identifiable {
    let name: String
    var present = false
    var id: String { name }
}

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
                }.fixedSize().border(.foreground)
            }
            HStack {
                ForEach(13..<26) { index in
                    LetterView(letter: $letters.letters[index])
                }.fixedSize().border(.foreground)
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

struct LetterView: View {
    @Binding var letter: Letter
    
    var body: some View {
        Text(letter.name)
            .font(.largeTitle)
            .padding()
            .frame(minWidth: 60)
            .background($letter.wrappedValue.present ? Color.white : Color(NSColor.windowBackgroundColor))
            .foregroundStyle($letter.wrappedValue.present ? .black : .gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

