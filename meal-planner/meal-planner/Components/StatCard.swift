//
//  Untitled.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//

import SwiftUI
struct StatCard: View {
    var title: String
    var value: String
    var color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.85))
            Text(value)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 80)
        .padding()
        .background(color.opacity(0.3))
        .cornerRadius(12)
        .shadow(color: color.opacity(0.4), radius: 5, x: 0, y: 3)
    }
}
