//
//  Untitled.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//

import SwiftUI

struct MealComponent: View {
    var meal: MealItem
    
    var body: some View {
        HStack(spacing: 16) {
            // Image section
            AsyncImage(url: URL(string: meal.img)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 120)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                        .cornerRadius(12)
                    
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                    
                @unknown default:
                    EmptyView()
                        .frame(width: 120, height: 120)
                }
            }
            
            // Text info
            VStack(alignment: .leading, spacing: 8) {
                Text(meal.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text("$ \(meal.price)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(meal.dsc)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 3)
    }
}
