//
//  JournalViewModel.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 09/07/25.
//


import Foundation

final
class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []
    private let storage: StorageProvider
    
    init(storage: StorageProvider = FileStorageProvider()) {
        self.storage = storage
    }
}
extension JournalViewModel {
    func addEntry(text: String) {
        let score = SentimentAnalyzer.analyze(text: text)
        let entry = JournalEntry(id: UUID(), date: Date(), text: text, sentimentScore: score)
        entries.insert(entry, at: 0)
        saveEntries()
    }

    func loadEntries() {
        do {
            entries = try storage.load()
        } catch {
            entries = []
        }
    }
}
private
extension JournalViewModel {
    func saveEntries() {
        do {
            try storage.save(entries)
        } catch {
        }
    }
}
