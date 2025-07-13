//
//  SentimentAnalyzerTests.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//


import Testing
@testable import InnerScribe

struct SentimentAnalyzerTests {
    @Test
    func testPositiveSentiment() {
        let text = "I'm feeling amazing and full of energy!"
        let score = SentimentAnalyzer.analyze(text: text)
        #expect(score > 0.3)
    }

    @Test
    func testNegativeSentiment() {
        let text = "This is terrible and I feel awful."
        let score = SentimentAnalyzer.analyze(text: text)
        #expect(score < -0.3)
    }

    @Test
    func testNeutralSentiment() {
        let text = "I went to the store and bought some groceries."
        let score = SentimentAnalyzer.analyze(text: text)
        #expect(abs(score) < 0.2)
    }
}

