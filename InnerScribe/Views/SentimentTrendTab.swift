//
//  SentimentTrendTab.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import SwiftUI
import Charts

struct SentimentTrendTab: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var animateChart = false

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
                        ForEach(sortedEntries) { entry in
                            // SentimentLine(entry: entry, animate: animateChart)
                        }
                    }
                    .chartYScale(domain: -1.0...1.0)
                    .frame(height: 250)
                    .padding()
                }

                Spacer()
            }
            .navigationTitle("Trends")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animateChart = true
            }
        }
    }
}
