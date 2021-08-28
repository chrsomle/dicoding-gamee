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

    enum CodingKeys: String, CodingKey {
        case id, name, released, rating, genres
        case backgroundImage = "background_image"
        case ratingTop = "rating_top"
    }
}

extension Game {
	var ratingRatio: String {
		let rating = self.rating > Double(ratingTop) ? Double(ratingTop) : self.rating
		let ratingBottom = String(format: "%.1f", rating)
		return "\(ratingBottom) / \(ratingTop)"
	}

	var releaseDate: String {
		let dateHelper = DateHelper(
			inputFormat: "yyyy-MM-dd",
			outputFormat: "MMM dd, yyyy"
		)

		return dateHelper.convert(date: released)
	}
}
