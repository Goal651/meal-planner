//
//  RemoteMealScreen.swift
//  meal-planner
//
//  Created by wigothehacker on 12/4/25.
//

import SwiftUI
import Foundation

struct RemoteMealsScreen: View {
    @EnvironmentObject var mv : MealViewModel

    var body: some View {
        VStack {
            Text("Remote Meals")
                .font(.title)
                .foregroundColor(.blue)
            Picker("Category", selection: $mv.selectedCategory) {
                ForEach(MealCategory.allCases, id: \.self) { category in
                    Text(category.rawValue.capitalized)
                }
            }
            .pickerStyle(.menu)
            .onChange(of: mv.selectedCategory) { newCategory in
                Task {
                    await mv.updateCategory(data: newCategory)
                }
            }

            List(mv.meals) { meal in
                VStack(alignment: .leading) {
                    MealComponent(meal: meal)
                }
                
            }
        }
        .background(.black)
        
    }
}
