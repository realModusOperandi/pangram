//
//  Data.swift
//  pangram
//
//  Created by Liam Westby on 7/2/23.
//

import SwiftUI

class Letters: ObservableObject {
    @Published var letters: [Letter]
    
    init() {
        letters = []
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ".forEach({
            letters.append(Letter(name: String($0)))
        })
    }
}
