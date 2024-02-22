//
//  TermView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct TermView: View {
//    var term: DummyTermModel
    var isTerm: Bool = true
    
    @State private var term: DummyTermModel? = nil
    
    private var termTitle: String {
        guard let term else { return "" }
        return term.title
    }
    
    private var termContent: String {
        guard let term else { return "" }
        return term.content
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                Text("\(termContent)")
                    .padding()
            }
            
            if term == nil {
                Text("약관 정보를 불러오고 있습니다.")
            }
        }
        .navigationTitle("\(termTitle)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                print("onAppear")
                term = isTerm ? dummyTerms.first! : dummyTerms.last!
            }
        }
    }
}

#Preview {
    NavigationStack {
        TermView()
    }
}
