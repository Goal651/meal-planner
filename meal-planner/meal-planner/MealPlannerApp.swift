//
//  meal_plannerApp.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//

import SwiftUI

@main
struct MealPlannerApp: App {
    @StateObject private var mealVM = MealViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mealVM)
        }
    }
}

