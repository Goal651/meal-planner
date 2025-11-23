import SwiftUI

struct WelcomeScreen: View {
    @Binding var showHome: Bool
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color(.systemBlue).opacity(0.8), Color(.systemTeal)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                Spacer()
                
                // App title with icon
                HStack(spacing: 10) {
                    Image(systemName: "fork.knife")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                    Text("Meal Planner")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                // Subtitle
                Text("Plan meals, track calories, and stay healthy every day!")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                // Get Started Button (blue)
                Button(action: { showHome = true }) {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title2)
                        Text("Get Started")
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
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding()
        }
    }
}
