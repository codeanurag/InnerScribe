//
//  SentimentAnalyzerTests.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//


import XCTest
@testable import InnerScribe

final class SentimentAnalyzerTests: XCTestCase {

    func testPositiveSentiment() {
        let text = "I'm feeling amazing and full of energy!"
        let score = SentimentAnalyzer.analyze(text: text)
        XCTAssertGreaterThan(score, 0.3, "Expected positive sentiment")
    }

    func testNegativeSentiment() {
        let text = "This is terrible and I feel awful."
        let score = SentimentAnalyzer.analyze(text: text)
        XCTAssertLessThan(score, -0.3, "Expected negative sentiment")
    }
}
