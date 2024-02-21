//
//  BoardView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(dummyArticles) { article in
                        BoardListItemView(article: article)
                    }
                }
                .padding(.bottom, 80)
            }
            
            // 플로팅 버튼
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        HStack {
                            Label("글쓰기", systemImage: "square.and.pencil")
                                .font(.title3)
                                .foregroundStyle(.white)
                        }
                        .frame(height: 50)
                        .padding(.horizontal)
                        .background(.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(radius: 10)
                    }
                }
            }
            .padding()
            .navigationTitle("핵꿀팁 게시판")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        BoardView()
    }
}



/*
 // 플로팅 버튼
 VStack(alignment: .trailing) {
     HStack(alignment: .bottom) {
         Button {
             
         } label: {
             Text("#$%%%")
         }
     }
 }
 */
