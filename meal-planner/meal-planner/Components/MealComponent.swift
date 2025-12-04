//
//  Untitled.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//

import SwiftUI

struct MealComponent: View {
    var meal:MealItem
    
    var body: some View {
        Text(meal.name).font(.headline)
        Text("\(meal.price) cal").foregroundColor(.gray)
        AsyncImage(url: URL(string: meal.img)) { phase in
            switch phase {
            case .empty:
                ProgressView()  // loading indicator
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(12)
                
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }

    }
}
