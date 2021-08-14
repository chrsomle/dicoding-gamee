import Foundation

// MARK: - Game
struct Game: Decodable, Identifiable {
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
