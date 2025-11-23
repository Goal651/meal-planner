//
//  AddMeal.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//
import SwiftUI

struct AddMealView: View {
    @EnvironmentObject var mealVM: MealViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var mealName = ""
    @State private var calories = ""
    @State private var selectedType = "Breakfast"
    
    let types = ["Breakfast", "Lunch", "Dinner", "Snack"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Meal Info")) {
                    TextField("Meal Name", text: $mealName)
                    TextField("Calories", text: $calories)
                        .keyboardType(.numberPad)
                    
                    Picker("Type", selection: $selectedType) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
                        }
                    }
                }
            }
            .navigationTitle("Add Meal")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let cal = Int(calories) {
                            let meal = Meal(name: mealName, calories: cal, type: selectedType)
                            mealVM.addMeal(meal)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddMealView()
        .environmentObject(MealViewModel())
}
