import Foundation

// MARK: - Game
struct Game: Codable, Identifiable {
    let id: Int
    let name, released: String
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let platforms: [Platform]
    let genres: [Genre]
    let screenshots: [Screenshot]

    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case platforms = "parent_platforms"
        case genres
        case screenshots = "short_screenshots"
    }

    init(
		id: Int,
		name: String,
		released: String,
		backgroundImage: String,
		rating: Double,
		ratingTop: Int,
		platforms: [Platform],
		genres: [Genre],
		screenshots: [Screenshot]
	) {
        self.id = id
        self.name = name
        self.released = released
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.ratingTop = ratingTop
        self.platforms = platforms
        self.genres = genres
        self.screenshots = screenshots
    }
}

extension Game {
	var releaseYear: String {
		released.prefix(4).description
	}
}
