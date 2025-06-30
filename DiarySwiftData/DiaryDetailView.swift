//
//  DiaryDetailView.swift
//  DiarySwiftData
//
//  Created by 仲優樹 on 2025/07/01.
//

import SwiftUI

struct DiaryDetailView: View {
    let entry: DiaryEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(entry.title)
                    .font(.title)
                    .bold()
                
                Text(entry.date.formatted(date: .long, time: .shortened))
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Divider()
                
                Text(entry.content)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("日記詳細")
    }
}
