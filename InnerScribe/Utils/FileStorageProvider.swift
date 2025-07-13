//
//  FileStorageProvider.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//

import Foundation

struct FileStorageProvider: StorageProvider {
    private let fileURL: URL

    init(fileURL: URL? = nil) {
        if let fileURL {
            self.fileURL = fileURL
        } else {
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            self.fileURL = path.appendingPathComponent("entries.json")
        }
    }

    func save(_ entries: [JournalEntry]) throws {
        let data = try JSONEncoder().encode(entries)
        try data.write(to: fileURL)
    }

    func load() throws -> [JournalEntry] {
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode([JournalEntry].self, from: data)
    }
}
