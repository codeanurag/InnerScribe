//
//  JournalEntry.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import Foundation

struct JournalEntry: Identifiable, Codable, Equatable {
    let id: UUID
    let date: Date
    let text: String
    let sentimentScore: Double
    var moodEmoji: Sentiment {
        Sentiment(score: sentimentScore)
    }
}
