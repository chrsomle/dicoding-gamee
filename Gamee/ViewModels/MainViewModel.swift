//
//  MainViewModel.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import Foundation

class MainViewModel: ObservableObject {
	@Published var games = [Game]()

	private let baseUrl = "https://api.rawg.io/api/games"

	init() {
		getGames()
	}

	func getGames() {
		var urlComponents = URLComponents(string: baseUrl)!

		urlComponents.queryItems = [
			URLQueryItem(name: "key", value: Networking.apiKey)
		]

		URLSession.shared.dataTask(with: urlComponents.url!) { data, res, _ in
			guard let res = res as? HTTPURLResponse, let data = data else { return }
			if res.statusCode == 200 {
				do {
					let decoder = JSONDecoder()
					decoder.keyDecodingStrategy = .convertFromSnakeCase
					let result = try decoder.decode(APIResponse.self, from: data)
					DispatchQueue.main.async {
						self.games = result.results
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
