//
//  DetailViewModel.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 15/08/21.
//

import Foundation

class DetailViewModel: ObservableObject {
	@Published var game: GameDetail?

	private let baseUrl: String

	init(gameID: Int) {
		baseUrl = "https://api.rawg.io/api/games/\(gameID)"
		getGameDetail()
	}

	func getGameDetail() {
		var urlComponents = URLComponents(string: baseUrl)!

		urlComponents.queryItems = [Networking.apiKey]

		URLSession.shared.dataTask(with: urlComponents.url!) { data, res, _ in
			guard let res = res as? HTTPURLResponse, let data = data else { return }
			if res.statusCode == 200 {
				do {
					let result = try JSONDecoder().decode(GameDetail.self, from: data)
					DispatchQueue.main.async {
						self.game = result
					}
				} catch {
					print("Parsing data failed:", error.localizedDescription)
				}
			} else {
				print("Error: \(data), HTTP Status: \(res.statusCode)")
			}
		}.resume()
	}
}
