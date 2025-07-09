//
//  SentimentTrendView.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import SwiftUI
import Charts

struct SentimentTrendView: View {
    let entries: [JournalEntry]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Mood Over Time")
                .font(.headline)
                .padding(.leading)

            Chart {
                ForEach(entries.sorted(by: { $0.date < $1.date })) { entry in
                    LineMark(
                        x: .value("Date", entry.date),
                        y: .value("Sentiment", entry.sentimentScore)
                    )
                    .foregroundStyle(entry.sentimentScore > 0.3 ? .green : (entry.sentimentScore < -0.3 ? .red : .gray))
                    .interpolationMethod(.catmullRom)
                }
            }
            .chartYScale(domain: -1.0...1.0)
            .frame(height: 200)
            .padding()
        }
    }
}
