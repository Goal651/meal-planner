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
        VStack {
            Text(title).font(.caption).foregroundColor(.gray)
            Text(value).font(.headline)
        }
        .frame(maxWidth: .infinity, minHeight: 70)
        .background(color.opacity(0.15))
        .cornerRadius(14)
    }
}
