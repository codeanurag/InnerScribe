//
//  StorageProvider.swift
//  InnerScribe
//
//  Created by Anurag Pandit on 13/07/25.
//

import Foundation

protocol StorageProvider {
    func save(_ entries: [JournalEntry]) throws
    func load() throws -> [JournalEntry]
}
