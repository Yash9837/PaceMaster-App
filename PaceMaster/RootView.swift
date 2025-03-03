//
//  RootView.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.
//
import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem { Label("Dashboard", systemImage: "house.fill") }
            HistoryView()
                .tabItem { Label("History", systemImage: "clock.arrow.circlepath") }
            
            InsightsView()
                .tabItem { Label("Insights", systemImage: "lightbulb.fill") }
        }
        .accentColor(AppTheme.primaryColor)
    }
}
#Preview{
    RootView()
}
