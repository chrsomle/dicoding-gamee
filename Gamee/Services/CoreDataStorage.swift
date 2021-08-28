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

    let context: NSManagedObjectContext

    private init() {
        container = NSPersistentContainer(name: "Favorite")
        container.loadPersistentStores { _, err in
            if let err = err as NSError? {
                assertionFailure("Core Data store failed to load with error: \(err), \(err.userInfo)")
            }
        }

        context = container.viewContext
    }

    func add(id: Int) {
        let favorite = Favorite(context: context)

        favorite.id = Int32(id)

        saveContext()
    }

    func remove(favorites: [Favorite]) {
        favorites.forEach { context.delete($0) }

        saveContext()
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()

                MainViewModel.shared.getFavorites()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
