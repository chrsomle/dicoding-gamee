//
//  MainView.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel = MainViewModel()

	var body: some View {

		NavigationView {
			Group {
				if viewModel.games.isEmpty {
					ProgressView()
				} else {
					ScrollView {
						LazyVStack {
							ForEach(viewModel.games, id: \.id) { game in
								GameRow(game: game)
									.padding(.bottom, 24)
									.padding(.horizontal)
							}
						}
					}
				}
			}
			.navigationTitle("Game List")
			.toolbar {
				NavigationLink(destination: AboutView()) {
					Image(systemName: "info.circle")
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
