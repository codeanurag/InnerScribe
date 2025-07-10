//
//  ContentView.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JournalViewModel()
    
    var body: some View {
        TabView {
            ChartView(entries: viewModel.entries)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            JournalTab(viewModel: viewModel)
                .tabItem {
                    Label("Journal", systemImage: "book.closed")
                }
            
            SentimentTrendTab(viewModel: viewModel)
                .tabItem {
                    Label("Trends", systemImage: "chart.line.uptrend.xyaxis")
                }
        }
        .onAppear {
            viewModel.loadEntries()
        }
    }
}


#Preview {
    ContentView()
}
