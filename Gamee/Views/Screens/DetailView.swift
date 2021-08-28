//
//  DetailView.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {

	@StateObject var viewModel: DetailViewModel

	init(gameID: Int) {
		_viewModel = StateObject(wrappedValue: DetailViewModel(gameID: gameID))
	}

	var body: some View {
		if let game = viewModel.game {
			content(game: game)
		} else {
			ProgressView()
		}
	}
}

// MARK: View Builders
extension DetailView {
	@ViewBuilder
	func content(game: GameDetail) -> some View {
		ScrollView(.vertical, showsIndicators: false) {
			GeometryReader { metrics in
				WebImage(url: URL(string: game.backgroundImage))
					.resizable()
					.indicator(content: { _, _ in
						ProgressView()
					})
					.transition(.fade(duration: 0.5))
					.scaledToFill()
					.offset(y: -metrics.frame(in: .global).minY + 48)
					.frame(
						width: UIScreen.main.bounds.width,
						height: metrics.frame(in: .global).minY > 0 ? metrics.frame(in: .global).minY + 360 : 360
					)
			}
			.frame(height: 360)

			VStack(alignment: .leading, spacing: 12) {
				VStack(alignment: .leading, spacing: 4) {
					Text(game.name)
						.font(.title3.weight(.semibold))
					Text("By \(game.publisherList)")
						.foregroundColor(.accentColor)
						.font(.subheadline)
				}

				Divider()

				VStack(alignment: .leading, spacing: 4) {
					sectionHeader(title: "Rating")
					RatingView(rating: game.rating, ratingTop: game.ratingTop)
						.foregroundColor(.accentColor)
				}

				section(title: "Platforms", content: game.platformList)

				section(title: "Genres", content: game.genreList)

				section(title: "Released", content: game.releaseDate)

				section(title: "Updated", content: game.latestUpdate)

				section(title: "About", content: game.description)
			}
			.foregroundColor(AppColor.foreground)
			.padding()
			.background(AppColor.background)
			.cornerRadius(16)
			.offset(y: -36)
		}
		.edgesIgnoringSafeArea(.all)
		.background(AppColor.background.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Detail", displayMode: .inline)
        .toolbar {
            Button {
                viewModel.toggleFavorite()
            } label: {
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .font(.title3)
                    .padding(6)
            }
        }
	}

	@ViewBuilder func section(title: String, content: String) -> some View {
		VStack(alignment: .leading, spacing: 4) {
			sectionHeader(title: title)
			Text(content)
				.font(.subheadline)
		}
	}

	@ViewBuilder func sectionHeader(title: String) -> some View {
		Text(title)
			.font(.headline)
			.bold()
			.foregroundColor(.secondary)
	}
}
