//
//  Untitled.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//

import SwiftUI
struct MealRow: View {
    var name: String
    var desc: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Circle()
                .fill(color)
                .frame(width: 12, height: 12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(desc)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.85))
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}
