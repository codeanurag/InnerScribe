//
//  NewEntryView.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import SwiftUI

struct NewEntryView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: JournalViewModel
    @State private var entryText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $entryText)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                Spacer()
            }
            .padding()
            .navigationTitle("New Entry")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if !entryText.trimmingCharacters(in: .whitespaces).isEmpty {
                            viewModel.addEntry(text: entryText)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
