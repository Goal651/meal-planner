//
//  Test.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//
import SwiftUI

struct WelcomeScreen: View {
    @Binding var showHome: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("🍽️ Meal Planner")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Plan meals, track calories, and stay healthy every day!")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: { showHome = true }) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}
