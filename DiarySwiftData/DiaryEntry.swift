//
//  DiaryEntry.swift
//  DiarySwiftData
//
//  Created by 仲優樹 on 2025/07/01.
//

import SwiftData
import Foundation

@Model
class DiaryEntry {
    @Attribute(.unique) var id: UUID
    var title: String
    var content: String
    var date: Date
    
    init(title: String, content: String, date: Date = Date()) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.date = date
    }
}
