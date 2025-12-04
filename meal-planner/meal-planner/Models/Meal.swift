//
//  Meal.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//

import Foundation


struct MealItem: Codable, Identifiable {
    let id: String
    let name: String
    let img:String
    let dsc:String
    let price:Double
    let rate:Int
    let country:String
}
enum MealCategory: String, CaseIterable {
    case bbqs = "bbqs"
    case bestFoods = "best-foods"
    case breads = "breads"
    case burgers = "burgers"
    case chocolates = "chocolates"
    case desserts = "desserts"
    case drinks = "drinks"
    case friedChicken = "fried-chicken"
    case iceCream = "ice-cream"
    case pizzas = "pizzas"
    case porks = "porks"
    case sandwiches = "sandwiches"
    case sausages = "sausages"
    case steaks = "steaks"
}

