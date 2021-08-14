//
//  GameDetail.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 15/08/21.
//

import Foundation

struct GameDetail: Decodable {
	typealias Genre = Entity

	let id: Int
	let name, released, updated, backgroundImage: String
	let rating: Double
	let ratingTop: Int
	let genres: [Genre]
	let publishers: [Entity]
	let description: String
	let platforms: [Platform]

	enum CodingKeys: String, CodingKey {
		case id, name, released, updated, rating, genres, publishers
		case backgroundImage = "background_image"
		case ratingTop = "rating_top"
		case description = "description_raw"
		case platforms = "parent_platforms"
	}
}

extension GameDetail {
	var publisherList: String {
		publishers.map({ $0.name }).joined(separator: ", ")
	}

	var platformList: String {
		platforms.map({ $0.platform.name }).joined(separator: ", ")
	}

	var genreList: String {
		genres.map({ $0.name }).joined(separator: ", ")
	}

	var releaseDate: String {
		let dateFormatterGet = DateFormatter()
		dateFormatterGet.dateFormat = "yyyy-MM-dd"

		let dateFormatterPrint = DateFormatter()
		dateFormatterPrint.dateFormat = "MMM dd, yyyy"

		if let date = dateFormatterGet.date(from: released) {
			return dateFormatterPrint.string(from: date)
		} else {
			return released
		}
	}

	var latestUpdate: String {
		let dateFormatterGet = DateFormatter()
		dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

		let dateFormatterPrint = DateFormatter()
		dateFormatterPrint.dateFormat = "EEEE, MMM dd, yyyy"

		if let date = dateFormatterGet.date(from: updated) {
			return dateFormatterPrint.string(from: date)
		} else {
			return updated
		}
	}
}