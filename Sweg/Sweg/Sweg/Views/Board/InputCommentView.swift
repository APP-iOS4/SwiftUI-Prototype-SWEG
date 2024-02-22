//
//  InputCommentView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct InputCommentView: View {
    @State private var textField: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                
            } label: {
                Image(systemName: "photo.badge.plus")
                    .font(.title)
            }
            .tint(.gray)
            
            HStack {
                TextField("댓글을 입력해주세요.", text: $textField)
                    .padding(3)
                    .focused($isFocused)
                Button {
                    
                } label: {
                    Image(systemName: "face.smiling")
                }
                .tint(.gray)
            }
            .padding(10)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Button {
                isFocused = false
            } label: {
                Image(systemName: "pencil.circle.fill")
                    .font(.title)
            }
            .disabled(textField.count < 1)
        }
        .padding(10)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    InputCommentView()
}
