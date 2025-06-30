//
//  DiarySwiftDataApp.swift
//  DiarySwiftData
//
//  Created by 仲優樹 on 2025/07/01.
//

import SwiftUI

@main
struct DiarySwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            DiaryListView()
        }
        .modelContainer(for: DiaryEntry.self)
    }
}
