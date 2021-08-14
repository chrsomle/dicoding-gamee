//
//  GameRow+ViewBuilders.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI

extension GameRow {
	@ViewBuilder func genreView(title: String) -> some View {
		Text(title)
			.font(.subheadline)
			.padding(.horizontal)
			.padding(.vertical, 4)
			.background(AppColor.secondary)
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
