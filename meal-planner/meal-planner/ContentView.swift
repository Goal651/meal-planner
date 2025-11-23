//
//  ContentView.swift
//  meal-planner
//
//  Created by wigothehacker on 11/23/25.
//
import SwiftUI

struct ContentView: View {
    @State private var showHome = false
    
    var body: some View {
        NavigationStack {
            if showHome {
                HomeView()
            } else {
                WelcomeScreen(showHome: $showHome)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
