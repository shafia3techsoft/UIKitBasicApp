//
//  FavouriteRecipeManager.swift
//  UIKitBasicApp
//
//  Created by shafia on 18/08/2025.
//

import Foundation
import CoreData
class FavouriteRecipeManager {
    
    func addToFavorites(meal: Meal) {
        let context = CoreDataManager.shared.context
        
        let favorite = FavoriteMeal(context: context)
        favorite.idMeal = meal.idMeal
        favorite.strMeal = meal.strMeal
        favorite.strMealThumb = meal.strMealThumb
        favorite.strCategory = meal.strCategory
        favorite.strArea = meal.strArea
        
        CoreDataManager.shared.saveContext()
    }

    func fetchFavorites() -> [FavoriteMeal] {
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<FavoriteMeal> = FavoriteMeal.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch {
            print("❌ Error fetching favorites: \(error)")
            return []
        }
    }
    
    func removeFromFavorites(idMeal: String) {
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<FavoriteMeal> = FavoriteMeal.fetchRequest()
        request.predicate = NSPredicate(format: "idMeal == %@", idMeal)
        
        if let result = try? context.fetch(request), let objectToDelete = result.first {
            context.delete(objectToDelete)
            CoreDataManager.shared.saveContext()
        }
    }

    func isFavorite(idMeal: String) -> Bool {
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<FavoriteMeal> = FavoriteMeal.fetchRequest()
        request.predicate = NSPredicate(format: "idMeal == %@", idMeal)
        
        let count = (try? context.count(for: request)) ?? 0
        return count > 0
    }
    
}
