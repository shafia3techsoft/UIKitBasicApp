//
//  CoreDataManager.swift
//  UIKitBasicApp
//
//  Created by shafia on 18/08/2025.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "RecipeModel") // must match .xcdatamodeld name
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("❌ Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("❌ Error saving Core Data: \(error)")
            }
        }
    }
    
}
