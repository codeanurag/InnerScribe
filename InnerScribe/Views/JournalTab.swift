//
//  JournalTab.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import SwiftUI

struct JournalTab: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var showNewEntry = false

    var body: some View {
        NavigationView {
            EntryListView(viewModel: viewModel)
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
        }
    }
}
