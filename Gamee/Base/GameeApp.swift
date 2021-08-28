//
//  GameeApp.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 13/08/21.
//

import SwiftUI

@main
struct GameeApp: App {
    let persistentStorage: CoreDataStorage = .shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistentStorage.container.viewContext)
        }
    }
}
