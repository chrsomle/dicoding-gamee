import Foundation

struct Screenshot: Codable {
    let id: Int
    let image: String

	init(id: Int, image: String) {
        self.id = id
        self.image = image
    }
}
