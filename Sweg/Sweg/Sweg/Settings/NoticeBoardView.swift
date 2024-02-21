//
//  NoticeBoardView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct NoticeBoardView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(dummyNotice) { notice in
                    NoticeBoardItem(notice: notice)
                }
                .padding(.zero)
            }
        }
        .navigationTitle("공지사항")
    }
}

#Preview {
    NavigationStack {
        NoticeBoardView()
    }
}
