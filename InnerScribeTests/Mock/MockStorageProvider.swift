//
//  MockStorageProvider.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//

@testable import InnerScribe
import Foundation
struct MockStorageProvider: StorageProvider {
    func save(_ entries: [InnerScribe.JournalEntry]) throws {
        //
    }
    
    var savedEntries: [JournalEntry] = []

    mutating func save(entries: [JournalEntry]) throws {
        savedEntries = entries
    }

    func load() throws -> [JournalEntry] {
        return savedEntries
    }
}

struct FailingStorageProvider: StorageProvider {
    enum MockError: Error { case diskFull }

    func save(_ entries: [JournalEntry]) throws {
        throw MockError.diskFull
    }

    func load() throws -> [JournalEntry] {
        throw MockError.diskFull
    }
}
