//
//  CommentListItemView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct CommentListItemView: View {
    @State private var recommandCount: Int = Int.random(in: 0...50)
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                Image("profileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("미꾸라지")
                        .fontWeight(.semibold)
                    Text("이건 댓글이에요. 하지만 하드코딩이죠.")
                    HStack {
                        Text("2024/02/21")
                            .foregroundStyle(.gray)
                        
                        Button {
                            
                        } label: {
                            Label("\(recommandCount)", systemImage: "hand.thumbsup")
                        }
                    }
                    .font(.caption)
                    .padding(.top, 10)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                }
                .tint(.gray)
            }
            .padding()
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.1))
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
    }
}

#Preview {
    CommentListItemView()
}
