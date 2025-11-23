import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mealVM: MealViewModel
    @State private var showAddMeal = false
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color(.black), Color(.systemTeal)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 24) {
                // Greeting
                Text("Hello, Goal 👋")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Here are your meals for today")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.85))
                
                // Stat Cards
                HStack(spacing: 16) {
                    StatCard(title: "Meals", value: "\(mealVM.meals.count)", color: .blue)
                    StatCard(title: "Calories", value: "\(mealVM.totalCalories())", color: .blue)
                    StatCard(title: "Water", value: "5 cups", color: .blue)
                }
                .padding(.vertical)
                
                // Today's Meals
                Text("Today’s Meals")
                    .font(.headline)
                    .foregroundColor(.white)
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(mealVM.meals) { meal in
                            MealRow(
                                name: meal.name,
                                desc: "\(meal.calories) cal",
                                color: .blue
                            )
                        }
                    }
                }
                
                Spacer()
                
                // Add Meal Button (blue themed + icon)
                Button(action: { showAddMeal = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                        Text("Add New Meal")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(.systemBlue), Color(.blue)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .padding(.vertical)
                .sheet(isPresented: $showAddMeal) {
                    AddMealView()
                        .environmentObject(mealVM)
                }
            }
            .padding()
        }
    }
}
 
