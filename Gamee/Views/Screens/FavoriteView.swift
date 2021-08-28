//
//  FavoriteView.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 28/08/21.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: MainViewModel = .shared

    var body: some View {
        NavigationView {
            Group {
                if viewModel.games.isEmpty {
                    ProgressView()
                } else {
                    content
                }
            }
            .navigationTitle("Favorites")
            .toolbar {
                NavigationLink(destination: AboutView()) {
                    Image(systemName: "info.circle")
                }
            }
        }
    }

    private var content: some View {
        let favorites = viewModel.games.filter { game in
            viewModel
                .favorites
                .map({ Int($0.id) })
                .contains(game.id)
        }

        return ScrollView {
            LazyVStack {
                ForEach(favorites, id: \.id) { game in
                    NavigationLink(
                        destination: DetailView(gameID: game.id)) {
                        GameRow(game: game)
                            .padding(.bottom, 24)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
