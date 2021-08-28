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
        NetworkingHelper.get(type: APIResponse.self, url: baseUrl) { [weak self] result in
            switch result {
            case .success(let response):
                self?.games = response.results
            case .failure(let error):
                print(error.localizedDescription)
                self?.games = []
            }
        }
	}
}
