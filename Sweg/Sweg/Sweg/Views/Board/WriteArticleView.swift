//
//  WriteArticleView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct WriteArticleView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var titleField: String = ""
    @State private var contentField: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Text("명예훼손, 광고/홍보 목적의 글은 올리실 수 없어요.")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(.accent.opacity(0.1))
                .foregroundStyle(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            TextField("제목을 입력하세요", text: $titleField)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)
                .focused($isFocused)
            
            ZStack {
                TextEditor(text: $contentField)
                    .background(.gray)
                    .contentMargins(0)
                    .offset(x: -7)
                    .focused($isFocused)
                if contentField.count <= 0 {
                    VStack {
                        Text("꿀팁에 대해 자유롭게 이야기 해보세요")
                            .foregroundStyle(.gray)
                            .offset(x: -2, y: 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                    }
                }
            }
        }
        .padding()
        
        VStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundStyle(.gray.opacity(0.3))
            
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "photo.badge.plus")
                        Text("사진추가")
                    }
                }
                
                Button {
                    
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "face.smiling")
                        Text("이모티콘")
                    }
                }
                
                Spacer()
                if isFocused {
                    Button {
                        isFocused = false
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
            .padding(10)
            .padding(.bottom, 10)
            .tint(.primary)
        }
        .navigationTitle("핵꿀팁 글쓰기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Text("완료")
                }
                .disabled(titleField.count <= 0 || contentField.count <= 0)
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        WriteArticleView()
    }
}
