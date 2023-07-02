//
//  Letter.swift
//  pangram
//
//  Created by Liam Westby on 7/2/23.
//

import Foundation

struct Letter: Identifiable {
    let name: String
    var present = false
    var id: String { name }
}
