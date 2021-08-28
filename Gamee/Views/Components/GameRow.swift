//
//  GameRow.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

class GameRowModel: ObservableObject {
    private let persistentStorage: CoreDataStorage = .shared
    @ObservedObject var mainViewModel: MainViewModel = .shared

    @Published var isFavorite = false

    let game: Game

    init(game: Game) {
        self.game = game

        refreshView()
    }

    func toggleFavorite() {
        let favoritesID = mainViewModel.favorites.map { Int($0.id) }

        if favoritesID.contains(game.id) {
            let subject = mainViewModel.favorites.filter { favorite in
                favorite.id == game.id
            }
            persistentStorage.remove(favorites: subject)
            isFavorite = false
        } else {
            persistentStorage.add(id: game.id)
            isFavorite = true
        }
    }

    func refreshView() {
        let favoritesID = mainViewModel.favorites.map { Int($0.id) }

        if favoritesID.contains(game.id) {
            isFavorite = true
        } else {
            isFavorite = false
        }
    }
}

struct GameRow: View {
    @StateObject var viewModel: GameRowModel

    init(game: Game) {
        let viewModel = GameRowModel(game: game)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

	var body: some View {
		VStack {
			Spacer(minLength: 180)
			VStack(alignment: .leading, spacing: 8) {

                HStack {
                    // MARK: Name
                    Text(viewModel.game.name)
                        .font(.title3)
                        .bold()

                    Spacer()

                    // MARK: isFavorite
                    Button {
                        viewModel.toggleFavorite()
                    } label: {
                        Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .font(.title3)
                            .padding(6)
                    }
                }

				HStack {
					// MARK: Release Year
                    Text("\(viewModel.game.releaseDate)  •")
						.font(.headline)
						.bold()
						.foregroundColor(.gray)

					// MARK: Rating
					HStack {
                        Text(viewModel.game.ratingRatio).bold()
                        RatingView(rating: viewModel.game.rating, ratingTop: viewModel.game.ratingTop)
					}
					.font(.caption)
					.foregroundColor(.accentColor)
				}

				// MARK: Genres
				ScrollView(.horizontal, showsIndicators: false) {
					LazyHStack(spacing: 12) {
                        ForEach(viewModel.game.genres, id: \.id) { genre in
							genreView(title: genre.name)
						}
					}
				}
				.frame(height: 28)
			}
			.padding()
			.foregroundColor(AppColor.foreground)
			.background(AppColor.background)
		}
		.background(
            WebImage(url: URL(string: viewModel.game.backgroundImage))
				.resizable()
				.indicator(content: { _, _ in
					ProgressView()
						.offset(y: -60)
				})
				.transition(.fade(duration: 0.5))
				.scaledToFill()
		)
		.cornerRadius(12)
        .onAppear {
            viewModel.refreshView()
        }
	}
}

// MARK: View Builders
extension GameRow {
	@ViewBuilder func genreView(title: String) -> some View {
		Text(title)
			.font(.subheadline)
			.padding(.horizontal)
			.padding(.vertical, 4)
			.background(AppColor.secondary)
			.cornerRadius(6)
	}
}
