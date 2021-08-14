//
//  GameDetailViewModel.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 15/08/21.
//

import Foundation

struct GameDetailViewModel {
	let game: GameDetail

	init(game: GameDetail) {
		self.game = game
	}

	var publisherList: String {
		game.publishers.map({ $0.name }).joined(separator: ", ")
	}

	var platformList: String {
		game.platforms.map({ $0.platform.name }).joined(separator: ", ")
	}

	var genreList: String {
		game.genres.map({ $0.name }).joined(separator: ", ")
	}

	var releaseDate: String {
		let dateFormatterGet = DateFormatter()
		dateFormatterGet.dateFormat = "yyyy-MM-dd"

		let dateFormatterPrint = DateFormatter()
		dateFormatterPrint.dateFormat = "MMM dd, yyyy"

		if let date = dateFormatterGet.date(from: game.released) {
			return dateFormatterPrint.string(from: date)
		} else {
			return game.released
		}
	}
}
