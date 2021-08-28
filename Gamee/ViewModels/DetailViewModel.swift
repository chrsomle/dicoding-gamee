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
        NetworkingHelper.get(type: GameDetail.self, url: baseUrl) { [weak self] result in
            switch result {
            case .success(let response):
                self?.game = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
	}
}
