//
//  JournalViewModelTests.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//


@testable import InnerScribe
import Testing
import Foundation

struct JournalViewModelTests {
    @Test
    func testSaveAndLoadEntries() {
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("test-entries.json")

        // Clean previous test file
        try? FileManager.default.removeItem(at: tempURL)

        let viewModel = JournalViewModel(fileURL: tempURL)
        viewModel.entries = []

        viewModel.addEntry(text: "Testing save and load")
        let savedEntry = viewModel.entries.first

        viewModel.entries = [] // simulate restart
        viewModel.loadEntries()

        #expect(viewModel.entries.count == 1)
        #expect(viewModel.entries.first?.text == savedEntry?.text)
    }
}


