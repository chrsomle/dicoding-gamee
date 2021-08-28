//
//  CoreDataStorage.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 28/08/21.
//

import CoreData

final class CoreDataStorage {
    static let shared = CoreDataStorage()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "Favorite")
        container.loadPersistentStores { desc, err in
            if let err = err as NSError? {
                assertionFailure("Core Data store failed to load with error: \(err), \(err.userInfo)")
            }
        }
    }
}
