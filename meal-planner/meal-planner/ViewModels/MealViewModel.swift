//
//  MealFetcher.swift
//  meal-planner
//
//  Created by wigothehacker on 12/4/25.
//

import Foundation
import SwiftUI

@MainActor
class MealViewModel: ObservableObject {
    @Published var meals: [MealItem] = []
    private let service = MealService()
    @Published var selectedCategory: MealCategory = .drinks


    func loadMeals() async {
        Task {
            do {
                meals = try await service.fetchMeals(for: selectedCategory)
            } catch {
                print("Error:", error)
            }
        }

    }
    
    func updateCategory(data:MealCategory )async{
        print(data)
        selectedCategory=data
        await loadMeals()
    }
}
