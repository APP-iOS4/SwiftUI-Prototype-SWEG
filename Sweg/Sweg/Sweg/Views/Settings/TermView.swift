//
//  TermView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct TermView: View {
    var term: DummyTermModel
    var body: some View {
        ScrollView {
            Text("\(term.content)")
                .padding()
        }
        .navigationTitle("\(term.title)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TermView(term: dummyTerms.first!)
    }
}
