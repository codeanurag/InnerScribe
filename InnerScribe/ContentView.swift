//
//  ContentView.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var showNewEntry = false
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.entries.isEmpty {
                    SentimentTrendView(entries: viewModel.entries)
                }
                
                EntryListView(viewModel: viewModel)
            }
            .navigationTitle("Emotion Journal")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showNewEntry = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showNewEntry) {
                NewEntryView(viewModel: viewModel)
            }
            .onAppear {
                viewModel.loadEntries()
            }
        }
    }
}

#Preview {
    ContentView()
}
