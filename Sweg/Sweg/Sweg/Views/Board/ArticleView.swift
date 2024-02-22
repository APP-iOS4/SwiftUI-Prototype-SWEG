//
//  ArticleView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct ArticleView: View {
    @Environment(\.scrollDismissesKeyboardMode) private var dismissKeyboard
    
    var article: DummyArticleModel
    
    var body: some View {
        ZStack {
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
                    
                    AdView()
                    
                    Text("\(article.content)")
                        .font(.body)
                        .padding()
                }
                CommentView()
                    .padding(.bottom, 100)
            }
            .scrollDismissesKeyboard(.immediately)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        ShareLink(item: article.shareMemo)
                            .tint(.primary)
                        
                        Button {
                            
                        } label: {
                            Label("신고하기", systemImage: "light.beacon.max")
                        }
                        .tint(.red)
                    }
                }
            }
            
            VStack {
                Spacer()
                InputCommentView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ArticleView(article: dummyArticles.first!)
    }
}
