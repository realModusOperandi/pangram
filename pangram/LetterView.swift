//
//  LetterView.swift
//  Pangram
//
//  Created by Liam Westby on 7/2/23.
//

import SwiftUI

struct LetterView: View {
    @Binding var letter: Letter
    
    var body: some View {
        Text(letter.name)
            .font(.largeTitle)
            .padding()
            .frame(minWidth: 60)
            .background($letter.wrappedValue.present ? Color.white : Color(NSColor.windowBackgroundColor))
            .foregroundStyle($letter.wrappedValue.present ? .black : .gray)
            .border(.foreground)
    }
}

struct LetterView_PreviewContainer : View {
    @State private var previewLetter = Letter(name: "A")

     var body: some View {
          LetterView(letter: $previewLetter)
     }
}

struct LetterView_Previews : PreviewProvider {
    static var previews: some View {
        LetterView_PreviewContainer()
    }
}
