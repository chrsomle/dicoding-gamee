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
					GameRow(game: game, metrics: metrics)
				}
			}
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
