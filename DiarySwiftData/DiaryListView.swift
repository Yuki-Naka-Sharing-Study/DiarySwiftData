//
//  DiaryListView.swift
//  DiarySwiftData
//
//  Created by 仲優樹 on 2025/07/01.
//

import SwiftUI
import SwiftData

struct DiaryListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \DiaryEntry.date, order: .reverse) private var entries: [DiaryEntry]
    @State private var showingNewEntry = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(entries) { entry in
                    NavigationLink(destination: DiaryDetailView(entry: entry)) {
                        VStack(alignment: .leading) {
                            Text(entry.title)
                                .font(.headline)
                            Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("日記一覧")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingNewEntry = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingNewEntry) {
                NewDiaryEntryView()
            }
        }
    }
    
    private func delete(offsets: IndexSet) {
        for index in offsets {
            context.delete(entries[index])
        }
    }
}
