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
    private var fileURL: URL
    
    init(fileURL: URL? = nil) {
        if let fileURL {
            self.fileURL = fileURL
        } else {
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            self.fileURL = path.appendingPathComponent("entries.json")
        }
    }

    func addEntry(text: String) {
        let score = SentimentAnalyzer.analyze(text: text)
        let entry = JournalEntry(id: UUID(),
                                 date: Date(),
                                 text: text,
                                 sentimentScore: score)
        entries.insert(entry, at: 0)
        saveEntries()
    }
}
private
extension JournalViewModel {
    func getFileURL() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return path.appendingPathComponent("entries.json")
    }
    
    func saveEntries() {
        if let data = try? JSONEncoder().encode(entries) {
            try? data.write(to: fileURL)
        }
    }
}

extension JournalViewModel {
    func loadEntries() {
        if let data = try? Data(contentsOf: fileURL),
           let decoded = try? JSONDecoder().decode([JournalEntry].self, from: data) {
            self.entries = decoded
        }
    }
}
