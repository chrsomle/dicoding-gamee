//
//  GameRow.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI

struct GameRow: View {
	let game: Game
	let metrics: GeometryProxy

    var body: some View {
		ZStack {
			// MARK: - Background Image
			Image("gta")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: metrics.size.width, height: 320, alignment: .center)

			// MARK: - Game Info
			VStack {
				Spacer()
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
		}
		.cornerRadius(12)
    }
}
