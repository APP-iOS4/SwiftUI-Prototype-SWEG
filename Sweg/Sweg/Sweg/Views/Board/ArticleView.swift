//
//  ArticleView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct ArticleView: View {
    var article: DummyArticleModel
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(article.subject)")
                        .font(.title3)
                    
                    HStack(spacing: 5) {
                        Text("\(article.nickname)")
                        
                        Text("\u{00B7}")
                        
                        Text("\(article.dateString)")
                        
                        
                        Spacer()
                        
                        Label("\(article.hits)", systemImage: "eyes")
                    }
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 10)
                }
                .padding()
                
                Divider()
                
                Text("\(article.content)")
                    .font(.body)
                    .padding()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ArticleView(article: dummyArticles.first!)
    }
}
