//
//  ExploreViewModel.swift
//  UIKitBasicApp
//
//  Created by shafia on 18/08/2025.
//


import Foundation

class ExploreViewModel {
    
    var recipeList: [Meal] = []
    let mealApiHandler = MealAPIHandler.shared
    
    func fetchAllRecipes(selectedAlphabet: String, completion: @escaping () -> Void) {
        Task {
            do {
                if selectedAlphabet.isEmpty{
                    let meals = try await mealApiHandler.fetchMeals(byLetter: "b")
                    self.recipeList = meals
                }
                else{
                    let meals = try await mealApiHandler.fetchMeals(byLetter: selectedAlphabet)
                    self.recipeList = meals
                }
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print("❌ Failed to fetch recipes: \(error)")
            }
        }
    }
}


