//
//  ChartView.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 10/07/25.
//

import SwiftUI
import Charts


struct ChartView: View {
    var entries: [JournalEntry]
    
    init(entries: [JournalEntry]) {
        self.entries = entries.sorted {
            $0.sentimentScore < $1.sentimentScore
        }
    }
    
    var body: some View {
        Chart(entries) { entry in
            SectorMark(angle: .value("Type", 1),
                       innerRadius: .ratio(0.75))
                .foregroundStyle(by: .value("sentiment",
                                            entry.moodEmoji))
        }
        .chartForegroundStyleScale([
            Sentiment.grateful: Sentiment.grateful.sentimentColor,
            Sentiment.proud: Sentiment.proud.sentimentColor,
            Sentiment.giddy: Sentiment.giddy.sentimentColor,
            Sentiment.hopeful: Sentiment.hopeful.sentimentColor,
            Sentiment.calm: Sentiment.calm.sentimentColor,
            Sentiment.anxious: Sentiment.anxious.sentimentColor,
            Sentiment.nostalgic: Sentiment.nostalgic.sentimentColor,
            Sentiment.lonely: Sentiment.lonely.sentimentColor,
            Sentiment.regretful: Sentiment.regretful.sentimentColor,
            Sentiment.frustrated: Sentiment.frustrated.sentimentColor
        ])
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    Image(systemName: "figure.mind.and.body")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: frame.height * 0.4)
                        .foregroundStyle(Color(white: 0.59))
                        .position(x: frame.midX, y: frame.midY)
                }
            }
        }
        .chartLegend(position: .trailing,
                     alignment: .center)
        .frame(height: 200)
        .padding()
    }
}
