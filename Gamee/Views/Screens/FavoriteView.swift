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
            .navigationTitle("Game List")
            .toolbar {
                NavigationLink(destination: AboutView()) {
                    Image(systemName: "info.circle")
                }
            }
        }
    }

    private var content: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.games, id: \.id) { game in
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
