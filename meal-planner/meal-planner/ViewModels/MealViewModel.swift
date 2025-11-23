//
//  MealViewModel.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func addMeal(_ meal: Meal) {
        meals.append(meal)
    }
    
    func totalCalories() -> Int {
        meals.reduce(0) { $0 + $1.calories }
    }
}
