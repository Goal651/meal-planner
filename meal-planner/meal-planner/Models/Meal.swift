//
//  Meal.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//

import Foundation

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let calories: Int
    let type: String
}
