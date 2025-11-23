//
//  Home.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mealVM: MealViewModel
    @State private var showAddMeal = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            Text("Hello, Goal 👋")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Here are your meals for today")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack(spacing: 20) {
                StatCard(title: "Meals", value: "\(mealVM.meals.count)", color: .green)
                StatCard(title: "Calories", value: "\(mealVM.totalCalories())", color: .orange)
                StatCard(title: "Water", value: "5 cups", color: .blue)
            }
            .padding(.vertical)
            
            Text("Today’s Meals")
                .font(.headline)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(mealVM.meals) { meal in
                        MealRow(name: meal.name, desc: "\(meal.calories) cal", color: .green)
                    }
                }
            }
            
            Spacer()
            
            Button(action: { showAddMeal = true }) {
                Text("Add New Meal")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .sheet(isPresented: $showAddMeal) {
                AddMealView()
            }
            
        }
        .padding()
    }
}

#Preview {
    HomeView()
        .environmentObject(MealViewModel())
}
