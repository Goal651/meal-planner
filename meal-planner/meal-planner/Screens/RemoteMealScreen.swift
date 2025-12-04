//
//  RemoteMealScreen.swift
//  meal-planner
//
//  Created by wigothehacker on 12/4/25.
//

import SwiftUI
import Foundation

struct RemoteMealsScreen: View {
    @StateObject var vm = MealRemoteViewModel()

    var body: some View {
        VStack {
            Text("Remote Meals")
                .font(.title)
                .foregroundColor(.blue)

            List(vm.meals) { meal in
                VStack(alignment: .leading) {
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
        }
        .task {
            await vm.loadMeals()  // automatically fetch on screen load
        }
    }
}
