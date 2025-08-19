//
//  SearchViewModel.swift
//  UIKitBasicApp
//
//  Created by shafia on 18/08/2025.
//

import Foundation
class SearchViewModel {
    
    var recipeList: [Meal] = []
    private let mealApiHandler = MealAPIHandler.shared
    
    func fetchAllRecipes(completion: @escaping () -> Void) {
        Task {
            do {
                let meals = try await mealApiHandler.fetchMeals(byLetter: "b")
                self.recipeList = meals
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print("❌ Failed to fetch recipes: \(error)")
            }
        }
    }
    
    func fetchRecipesByNameAndIng(searchStr:String, completion: @escaping () -> Void) {
        Task {
            do {

//                if searchStr.isEmpty {
                    var meals = try await mealApiHandler.searchMeals(byName: searchStr)
//                    meals += try await mealApiHandler.searchMeals(byIngredient: searchStr)
                    self.recipeList = meals
//                }
//                else {
//                    self.recipeList = try await mealApiHandler.fetchMeals(byLetter: "b")
//                }
                
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print("❌ Failed to fetch recipes: \(error)")
            }
        }
    }
}
