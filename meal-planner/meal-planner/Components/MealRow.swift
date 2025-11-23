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
        HStack {
            Circle()
                .fill(color)
                .frame(width: 16, height: 16)
            
            VStack(alignment: .leading) {
                Text(name).font(.headline)
                Text(desc).font(.subheadline).foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
