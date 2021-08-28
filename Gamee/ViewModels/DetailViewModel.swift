//
//  DetailViewModel.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 15/08/21.
//

import SwiftUI

class DetailViewModel: ObservableObject {
	@Published var game: GameDetail?

    private let persistentStorage: CoreDataStorage = .shared

    @ObservedObject var mainViewModel: MainViewModel = .shared

	private let baseUrl: String

    @Published var isFavorite = false

    let gameID: Int

	init(gameID: Int) {
		baseUrl = "https://api.rawg.io/api/games/\(gameID)"

        self.gameID = gameID

        getGameDetail()

        let favoritesID = mainViewModel.favorites.map { Int($0.id) }

        if favoritesID.contains(gameID) {
            isFavorite = true
        }
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

    func toggleFavorite() {
        let favoritesID = mainViewModel.favorites.map { Int($0.id) }

        if favoritesID.contains(gameID) {
            let subject = mainViewModel.favorites.filter { favorite in
                favorite.id == gameID
            }
            persistentStorage.remove(favorites: subject)
            isFavorite = false
        } else {
            persistentStorage.add(id: gameID)
            isFavorite = true
        }
    }
}
