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
    @Test
    func testMaxEntriesSavedAndLoaded() {
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("stress-test.json")
        try? FileManager.default.removeItem(at: tempURL)
        
        let viewModel = JournalViewModel(fileURL: tempURL)
        viewModel.entries = []
        
        let totalEntries = 1000
        
        for i in 1...totalEntries {
            viewModel.addEntry(text: "Entry \(i)")
        }
        
        #expect(viewModel.entries.count == totalEntries)
        
        // Reload and verify
        let reloadModel = JournalViewModel(fileURL: tempURL)
        reloadModel.loadEntries()
        #expect(reloadModel.entries.count == totalEntries)
        #expect(reloadModel.entries.first?.text == "Entry \(totalEntries)")
    }
    
    @Test
    func testSaveFailsWithInvalidPath() {
        // Simulate a path that can't be written to (like root dir)
        let invalidURL = URL(fileURLWithPath: "/this/path/should/fail.json")
        let viewModel = JournalViewModel(fileURL: invalidURL)
        viewModel.entries = []

        // This should silently fail — we can test that the file doesn't exist
        viewModel.addEntry(text: "This write should fail")

        let fileExists = FileManager.default.fileExists(atPath: invalidURL.path)
        #expect(!fileExists)
    }
}


