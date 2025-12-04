//
//  MealFetcher.swift
//  meal-planner
//
//  Created by wigothehacker on 12/4/25.
//

import Foundation

@MainActor
class MealRemoteViewModel: ObservableObject {
    @Published var meals: [MealItem] = []
    private let service = MealService()

    func loadMeals() async {
        do {
            meals = try await service.fetchMeals()
        } catch {
            print("Error fetching meals:", error)
        }
    }
}
