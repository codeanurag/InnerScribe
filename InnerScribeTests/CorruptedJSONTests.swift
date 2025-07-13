//
//  CorruptedJSONTests.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//


@testable import InnerScribe
import Foundation
import Testing

struct CorruptedJSONTests {
    @Test
    func testLoadFailsOnCorruptedJSON() {
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("corrupt.json")

        // Write invalid JSON
        let invalidData = "💥 Not valid JSON 💥".data(using: .utf8)!
        try? invalidData.write(to: tempURL)

        let storage = FileStorageProvider(fileURL: tempURL)
        let viewModel = JournalViewModel(storage: storage)

        viewModel.loadEntries()

        // It should not crash, and entries should be empty
        #expect(viewModel.entries.isEmpty)
    }
}
