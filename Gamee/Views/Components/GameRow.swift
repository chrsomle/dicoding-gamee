//
//  GameRow.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameRow: View {
	let game: Game

	var body: some View {
		VStack {
			Spacer(minLength: 180)
			VStack(alignment: .leading, spacing: 8) {

				// MARK: Name
				Text(game.name)
					.font(.title3)
					.bold()

				HStack {
					// MARK: Release Year
					Text("\(game.releaseDate)  •")
						.font(.headline)
						.bold()
						.foregroundColor(.gray)

					// MARK: Rating
					HStack {
						Text(game.ratingRatio).bold()
						RatingView(rating: game.rating, ratingTop: game.ratingTop)
					}
					.font(.caption)
					.foregroundColor(.accentColor)
				}

				// MARK: Genres
				ScrollView(.horizontal, showsIndicators: false) {
					LazyHStack(spacing: 12) {
						ForEach(game.genres, id: \.id) { genre in
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
			AsyncImage(url: URL(string: game.backgroundImage)!) {
				ProgressView()
					.offset(y: -60)
			}
		)
		.cornerRadius(12)
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
