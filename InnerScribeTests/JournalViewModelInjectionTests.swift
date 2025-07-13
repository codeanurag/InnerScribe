//
//  JournalViewModelInjectionTests.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//


@testable import InnerScribe
import Testing

struct JournalViewModelInjectionTests {
    @Test
    func testInMemorySaveAndLoad() {
        var mock = MockStorageProvider()
        let viewModel = JournalViewModel(storage: mock)
        viewModel.addEntry(text: "Memory test")

        mock.savedEntries = viewModel.entries // capture mock state

        let reloadVM = JournalViewModel(storage: mock)
        reloadVM.loadEntries()

        #expect(reloadVM.entries.first?.text == "Memory test")
    }

    @Test
    func testDiskFullSaveFails() {
        let failing = FailingStorageProvider()
        let viewModel = JournalViewModel(storage: failing)

        viewModel.addEntry(text: "Should fail silently")

        #expect(viewModel.entries.count == 1) // still in memory
    }
}
