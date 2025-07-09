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
        tagger.string = text
        let (sentiment, _) = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore)
        return Double(sentiment?.rawValue ?? "0") ?? 0
    }
}
