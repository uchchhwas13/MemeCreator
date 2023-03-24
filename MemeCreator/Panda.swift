//
//  Panda.swift
//  MemeCreator
//
//  Created by Uchchhwas Roy on 24/3/23.
//

import Foundation

struct Panda: Codable {
    var description: String
    var imageUrl: URL?
    
    static let defaultPanda = Panda(description: "Cute Panda",
                                        imageUrl: URL(string:"https://assets.devpubs.apple.com/playgrounds/_assets/pandas/pandaBuggingOut.jpg"))
}

struct PandaCollection: Codable {
    var sample: [Panda]
}
