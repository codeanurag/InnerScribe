//
//  JournalViewModelTests.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//


import XCTest
@testable import InnerScribe

final class JournalViewModelTests: XCTestCase {

    var viewModel: JournalViewModel!

    override func setUp() {
        super.setUp()
        viewModel = JournalViewModel()
        viewModel.entries = [] // Clear state
    }

    func testAddEntryStoresCorrectTextAndSentiment() {
        let input = "I'm happy today!"
        viewModel.addEntry(text: input)
        let entry = viewModel.entries.first

        XCTAssertNotNil(entry)
        XCTAssertEqual(entry?.text, input)
        XCTAssertGreaterThan(entry?.sentimentScore ?? 0, 0)
    }

    func testSaveAndLoadEntries() {
        viewModel.addEntry(text: "Testing save and load")

        let savedEntries = viewModel.entries
        viewModel.entries = [] // Clear manually
        viewModel.loadEntries()

        XCTAssertEqual(viewModel.entries.count, savedEntries.count)
        XCTAssertEqual(viewModel.entries.first?.text, savedEntries.first?.text)
    }
}
