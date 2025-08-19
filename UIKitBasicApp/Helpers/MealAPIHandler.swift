
import Foundation

enum MealAPIError: Error {
    case invalidURL
    case invalidResponse
    case noData
    case decodingError
    case serverError(Int)
}

class MealAPIHandler {
    
    static let shared = MealAPIHandler()
//    private init() {}
    
    private let baseURL = "https://www.themealdb.com/api/json/v1/1"
    
    // MARK: - Fetch meals by first letter (A-Z)
    func fetchMeals(byLetter letter: String) async throws -> [Meal] {
        guard let url = URL(string: "\(baseURL)/search.php?f=\(letter)") else {
            throw MealAPIError.invalidURL
        }
        return try await fetchMeals(from: url)
    }
    
    // MARK: - Search meals by name
    func searchMeals(byName name: String) async throws -> [Meal] {
        guard let url = URL(string: "\(baseURL)/search.php?s=\(name)") else {
            throw MealAPIError.invalidURL
        }
        return try await fetchMeals(from: url)
    }
    
    // MARK: - Search meals by ingredient
    func searchMeals(byIngredient ingredient: String) async throws -> [Meal] {
        guard let url = URL(string: "\(baseURL)/filter.php?i=\(ingredient)") else {
            throw MealAPIError.invalidURL
        }
        return try await fetchMeals(from: url)
    }
    
    // MARK: - Private fetcher
    private func fetchMeals(from url: URL) async throws -> [Meal] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw MealAPIError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        do {
            let result = try decoder.decode(MealResponse.self, from: data)
            return result.meals ?? []
        } catch {
            throw MealAPIError.decodingError
        }
    }
}
