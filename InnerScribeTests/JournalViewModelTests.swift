//
//  JournalViewModelTests.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//


@testable import InnerScribe
import Testing

struct JournalViewModelTests {
    @Test
    func testAddEntryStoresCorrectTextAndSentiment() {
        let viewModel = JournalViewModel()
        viewModel.entries = []

        let input = "I'm happy today!"
        viewModel.addEntry(text: input)

        #expect(viewModel.entries.count == 1)
        #expect(viewModel.entries.first?.text == input)
        #expect((viewModel.entries.first?.sentimentScore ?? 0) > 0)
    }

    @Test
    func testSaveAndLoadEntries() {
        let viewModel = JournalViewModel()
        viewModel.entries = []

        viewModel.addEntry(text: "Testing save and load")
        let savedEntry = viewModel.entries.first

        viewModel.entries = []
        viewModel.loadEntries()

        #expect(viewModel.entries.count == 1)
        #expect(viewModel.entries.first?.text == savedEntry?.text)
    }
}

