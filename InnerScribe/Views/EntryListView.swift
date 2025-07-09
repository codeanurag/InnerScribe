//
//  EntryListView.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import SwiftUI

struct EntryListView: View {
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        List(viewModel.entries) { entry in
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.text)
                    .lineLimit(2)
                    .font(.body)
                HStack {
                    Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                    Spacer()
                    Text(entry.moodEmoji)
                        .font(.largeTitle)
                }
            }
            .padding(.vertical, 4)
        }
    }
}
