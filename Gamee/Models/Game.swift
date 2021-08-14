//
//  Game.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import Foundation

// MARK: - Game
struct Game: Decodable, Identifiable {
	typealias Genre = Entity

    let id, ratingTop: Int
    let name, released, backgroundImage: String
    let rating: Double
    let genres: [Genre]
}

extension Game {
	var releaseYear: String {
		released.prefix(4).description
	}
}
