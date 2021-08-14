//
//  GameRow.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI

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
					Text("\(game.releaseYear)   • ")
						.font(.headline)
						.bold()
						.foregroundColor(.gray)

					// MARK: Rating
					ratingView(rating: game.rating, ratingTop: game.ratingTop)
						.font(.caption)
				}

				// MARK: Genres
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
		.background(
			AsyncImage(url: URL(string: game.backgroundImage)!) {
				ProgressView()
					.offset(y: -60)
			}
		)
		.cornerRadius(12)
	}
}
