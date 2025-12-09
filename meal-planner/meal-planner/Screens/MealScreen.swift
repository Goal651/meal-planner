import SwiftUI
import Foundation

struct MealsScreen: View {
    @EnvironmentObject var mv: MealViewModel

    var body: some View {
        ZStack {
            // Dark blue gradient background
            LinearGradient(
                colors: [Color.black, Color.blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Remote Meals")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Picker("Category", selection: $mv.selectedCategory) {
                    ForEach(MealCategory.allCases, id: \.self) { category in
                        Text(category.rawValue.capitalized)
                            .foregroundColor(.black)
                    }
                }
                .pickerStyle(.menu)
                .padding(.horizontal)
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .onChange(of: mv.selectedCategory) { newCategory in
                    Task {
                        await mv.updateCategory(data: newCategory)
                    }
                }
                
                List(mv.meals) { meal in
                    MealComponent(meal: meal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .listRowBackground(Color.clear) // transparent to show gradient
                }
                .listStyle(PlainListStyle())
                .background(Color.clear) // List background transparent
            }
            .padding()
        }
    }
}
