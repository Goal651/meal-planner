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


struct MealItem: Codable, Identifiable {
    let id: String
    let name: String
    let img:String
    let dsc:String
    let price:Double
    let rate:Int
    let country:String
}
