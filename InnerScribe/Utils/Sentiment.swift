//
//  Sentiment.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 10/07/25.
//

import Charts
import SwiftUI

enum Sentiment: String, CaseIterable, Codable, Plottable {
    case grateful = "GRATEFUL"
    case lonely = "LONELY"
    case frustrated = "FRUSTRATED"
    case calm = "CALM"
    case hopeful = "HOPEFUL"
    case anxious = "ANXIOUS"
    case proud = "PROUD"
    case nostalgic = "NOSTALGIC"
    case regretful = "REGRETFUL"
    case giddy = "GIDDY"
    
    init(score: Double) {
        switch score {
        case ..<(-0.6):
            self = .frustrated
        case -0.6..<(-0.3):
            self = .lonely
        case -0.3..<(-0.1):
            self = .regretful
        case -0.1..<0.1:
            self = .anxious
        case 0.1..<0.3:
            self = .calm
        case 0.3..<0.6:
            self = .grateful
        case 0.6...:
            self = .giddy
        default:
            self = .anxious
        }
    }
    
    var emoji: String {
        switch self {
        case .grateful: return "😊"
        case .lonely: return "😔"
        case .frustrated: return "😡"
        case .calm: return "😌"
        case .hopeful: return "🥹"
        case .anxious: return "😕"
        case .proud: return "😄"
        case .nostalgic: return "🥲"
        case .regretful: return "😬"
        case .giddy: return "❤️‍🔥"
        }
    }
    
    var displayName: String {
        rawValue.capitalized
    }
    
    var sentimentColor: Color {
        switch self {
        case .grateful, .proud, .giddy:
            return .green
        case .hopeful, .calm:
            return .blue
        case .anxious, .nostalgic:
            return .gray
        case .lonely, .regretful:
            return .orange
        case .frustrated:
            return .red
        }
    }
}
