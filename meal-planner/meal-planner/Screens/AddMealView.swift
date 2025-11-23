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
            VStack(spacing: 20) {
                
                // Form Fields
                VStack(alignment: .leading, spacing: 15) {
                    Text("Meal Name")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.85))
                    TextField("Enter meal name", text: $mealName)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    Text("Calories")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.85))
                    TextField("Enter calories", text: $calories)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    Text("Type")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.85))
                    Picker("Select type", selection: $selectedType) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Save Button (Blue + icon)
                Button(action: saveMeal) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                        Text("Save Meal")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(.systemBlue), Color(.blue)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal)
                
            }
            .padding()
            .navigationTitle("Add Meal")
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(.black), Color(.systemTeal)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
    
    // MARK: - Functions
    private func saveMeal() {
        guard !mealName.isEmpty, let cal = Int(calories), cal > 0 else {
            print("Invalid input")
            return
        }
        let meal = Meal(name: mealName, calories: cal, type: selectedType)
        mealVM.addMeal(meal)
        // Clear inputs for next entry
        mealName = ""
        calories = ""
        selectedType = "Breakfast"
        dismiss()
    }
}
