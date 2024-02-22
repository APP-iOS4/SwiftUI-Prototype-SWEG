//
//  BoardView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct BoardView: View {
    @State private var isNavigationDestination: Bool = false
    
    @State private var randomAdCount: Int = Int.random(in: 0..<dummyArticles.count)
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<dummyArticles.count, id: \.self) { i in
                            if i == randomAdCount {
                                AdView()
                            }
                            BoardListItemView(article: dummyArticles[i])
                        }
                    }
                    .padding(.bottom, 70)
                    .navigationTitle("핵꿀팁 게시판")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .onAppear {
                randomAdCount = Int.random(in: 0..<dummyArticles.count)
                }
                .navigationDestination(isPresented: $isNavigationDestination) {
                    WriteArticleView()
                }
                
                // 플로팅 버튼
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            isNavigationDestination.toggle()
                        } label: {
                            HStack {
                                Label("글쓰기", systemImage: "square.and.pencil")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                            .frame(height: 40)
                            .padding(.horizontal)
                            .background(.accent)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 10)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    NavigationStack {
        BoardView()
    }
}
