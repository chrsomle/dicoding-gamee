//
//  MainViewModel.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import Foundation
import CoreData
import SwiftUI

final class MainViewModel: ObservableObject {
    private let persistentStorage: CoreDataStorage = .shared

    @Published var games = [Game]()
	@Published var favorites = [Favorite]()

	private let baseUrl = "https://api.rawg.io/api/games"

    static let shared = MainViewModel()

	private init() {
        getGames()
        getFavorites()
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

    func getFavorites() {
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        do {
            favorites = try persistentStorage.context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
}
