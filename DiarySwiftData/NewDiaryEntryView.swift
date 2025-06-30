//
//  NewDiaryEntryView.swift
//  DiarySwiftData
//
//  Created by 仲優樹 on 2025/07/01.
//

import SwiftUI
import SwiftData

struct NewDiaryEntryView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("タイトル", text: $title)
                TextEditor(text: $content)
                    .frame(minHeight: 200)
            }
            .navigationTitle("新しい日記")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        let entry = DiaryEntry(title: title, content: content)
                        context.insert(entry)
                        dismiss()
                    }.disabled(title.isEmpty || content.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("キャンセル") {
                        dismiss()
                    }
                }
            }
        }
    }
}
