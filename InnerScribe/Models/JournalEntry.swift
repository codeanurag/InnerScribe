//
//  JournalEntry.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import Foundation

struct JournalEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let text: String
    let sentimentScore: Double

    var moodEmoji: String {
        switch sentimentScore {
        case let x where x > 0.3: return "😄"
        case let x where x < -0.3: return "😞"
        default: return "😐"
        }
    }
}
