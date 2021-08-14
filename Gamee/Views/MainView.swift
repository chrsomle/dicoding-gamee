//
//  MainView.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI

struct MainView: View {
	let game = Game(
		id: 1,
		name: "Grand Theft Auto V",
		released: "2013-09-17",
		backgroundImage: "gta",
		rating: 4.48,
		ratingTop: 5,
		platforms: [
			Platform(id: 1, name: "PC"),
			Platform(id: 1, name: "XBox"),
			Platform(id: 1, name: "PlayStation")
		],
		genres: [
			Genre(id: 1, name: "Action"),
			Genre(id: 2, name: "Adventure")
		],
		screenshots: []
	)

	var body: some View {
		NavigationView {
			List([game]) { game in
				GeometryReader { metrics in
					gameRow(game: game, metrics: metrics)
				}
			}
		}
	}
}

// MARK: View Builders
extension MainView {
	@ViewBuilder func gameRow(game: Game, metrics: GeometryProxy) -> some View {
		ZStack {
			Image("gta")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: metrics.size.width, height: 320, alignment: .center)
			VStack {
				Spacer()
				VStack(alignment: .leading, spacing: 8) {
					Text(game.name)
						.font(.title3)
						.bold()
					HStack {
						Text("\(game.releaseYear)   • ")
							.font(.headline)
							.bold()
							.foregroundColor(.gray)
						ratingView(rating: game.rating, ratingTop: game.ratingTop)
							.font(.caption)
					}

					ScrollView(.horizontal) {
						LazyHStack(spacing: 12) {
							ForEach(game.genres, id: \.id) { genre in
								genreView(title: genre.name)
							}
						}
					}.frame(height: 28)
				}
				.padding()
				.foregroundColor(AppColor.primary)
				.background(Color.primary)
			}
		}
		.cornerRadius(12)
	}

	@ViewBuilder func genreView(title: String) -> some View {
		Text(title)
			.font(.subheadline)
			.padding(.horizontal)
			.padding(.vertical, 4)
			.background(Color.secondary)
			.cornerRadius(6)
	}

	@ViewBuilder func ratingView(rating: Double, ratingTop: Int) -> some View {
		Group {
			Image(systemName: "star.fill")
			Image(systemName: "star.fill")
			Image(systemName: "star.fill")
			Image(systemName: "star.fill")
			Image(systemName: "star.fill")
		}
		.foregroundColor(.accentColor)
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
