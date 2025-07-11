//
//  SentimentTrendTab.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import SwiftUI
import Charts

import SwiftUI
import Charts

struct SentimentTrendTab: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var entriesToShow: [JournalEntry] = []

    var sortedEntries: [JournalEntry] {
        viewModel.entries.sorted(by: { $0.date < $1.date })
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if sortedEntries.isEmpty {
                    Spacer()
                    Text("No data yet.\nStart writing to see your emotional trends!")
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.title3)
                    Spacer()
                } else {
                    Text("Mood Over Time")
                        .font(.title2)
                        .bold()
                        .padding(.leading)

                    Chart {
                        ForEach(entriesToShow) { entry in
                            LineMark(
                                x: .value("Date", entry.date),
                                y: .value("Sentiment", entry.sentimentScore)
                            )
                            .interpolationMethod(.catmullRom)
                            .foregroundStyle(color(for: entry.sentimentScore))
                            .symbol(Circle())
                        }
                    }
                    .chartYScale(domain: -1.0...1.0)
                    .frame(height: 250)
                    .padding()
                    .transition(.opacity)
                }

                Spacer()
            }
            .navigationTitle("Trends")
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                entriesToShow = sortedEntries
            }
        }
        .onChange(of: viewModel.entries) {
            withAnimation(.easeInOut(duration: 0.5)) {
                entriesToShow = sortedEntries
            }
        }
    }

    private func color(for score: Double) -> Color {
        if score > 0.3 {
            return .green
        } else if score < -0.3 {
            return .red
        } else {
            return .gray
        }
    }
}

