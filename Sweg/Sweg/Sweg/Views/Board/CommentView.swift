//
//  CommentView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct CommentView: View {
    @State private var isSelectedNewest: Bool = false
    
    private var commandCount: Int = Int.random(in: 0...50)
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.1))
                    .frame(maxWidth: .infinity, maxHeight: 10)

                HStack() {
                    HStack(spacing: 5) {
                        Text("댓글")
                            .fontWeight(.semibold)
                        Text("\(commandCount)")
                    }
                    
                    Spacer()
                    
                    Button {
                        isSelectedNewest = true
                    } label: {
                        Text("등록순")
                            .fontWeight(isSelectedNewest ? .bold : .regular)
                    }
                    .tint(isSelectedNewest ? .accent : .gray)
                    
                    Button {
                        isSelectedNewest = false
                    } label: {
                        Text("추천순")
                            .fontWeight(!isSelectedNewest ? .bold : .regular)
                    }
                    .tint(!isSelectedNewest ? .accent : .gray)
                }
                .padding(15)
            }
            
            ForEach(0..<commandCount, id: \.self) { _ in
                CommentListItemView()
            }
        }
    }
}

#Preview {
    CommentView()
}
