//
//  MealService.swift
//  meal-planner
//
//  Created by wigothehacker on 12/4/25.
//

import Foundation

class MealService {
    let baseURL = "https://free-food-menus-api-two.vercel.app/"

    func fetchMeals(for category: MealCategory) async throws -> [MealItem] {
        let fullURL = baseURL + category.rawValue
        print(fullURL)
        guard let url = URL(string: fullURL) else { return [] }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([MealItem].self, from: data)
    }
}
