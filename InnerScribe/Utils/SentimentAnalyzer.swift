//
//  SentimentAnalyzer.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import NaturalLanguage

struct SentimentAnalyzer {
    static func analyze(text: String) -> Double {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        var sentimentScore = 0.0
        tagger.string = text
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex,
            unit: .paragraph,
            scheme: .sentimentScore,
            options: []
        ) { sentimentTag, _ in
                if let sentimentString = sentimentTag?.rawValue,
                   let score = Double(sentimentString) {
                    sentimentScore = score
                    return true
                }
                return false
            }
        return sentimentScore
    }
}
