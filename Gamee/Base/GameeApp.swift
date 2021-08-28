//
//  GameeApp.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 13/08/21.
//

import SwiftUI

@main
struct GameeApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "list.bullet.below.rectangle")
                        Text("Game List")
                    }
                FavoriteView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favorites")
                    }
            }
        }
    }
}
