//
//  BoardListItemView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct BoardListItemView: View {
    @State private var isNavigationDestination: Bool = false
    
    var article: DummyArticleModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(article.subject)")
                    .font(.title3)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(article.content)")
                    .lineLimit(1)
                    .font(.body)
                    .foregroundStyle(.gray)
                    .padding(.trailing, 50)
                
                HStack(spacing: 5) {
                    Text("\(article.nickname)")
                    Text("\u{00B7}")
                    Text("\(article.dateString)")
                    
                    Spacer()
                    
                    HStack(spacing: 5) {
                        Image(systemName: "eyes")
                        Text("\(article.hits)")
                    }
                    
                    HStack(spacing: 5) {
                        Image(systemName: "bubble")
                        Text("\(article.comments)")
                    }
                    .foregroundStyle(.accent)
                    .padding(.leading, 10)
                }
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.top, 10)
                
            }
            .padding()
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundStyle(.gray.opacity(0.1))
        }
        .onTapGesture {
            isNavigationDestination.toggle()
        }
        .navigationDestination(isPresented: $isNavigationDestination) {
            ArticleView(article: article)
        }
    }
}

#Preview {
    NavigationStack {
        BoardListItemView(article: dummyArticles[2])
    }
}
