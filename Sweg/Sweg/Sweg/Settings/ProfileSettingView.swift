//
//  ProfileSettingView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct ProfileSettingView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var textField: String = ""
    
    var body: some View {
        Spacer()
        
        VStack {
            ZStack {
                Image("profileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .background(.gray)
                    .clipShape(Circle())
                
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "photo")
                            .font(.title3)
                    }
                    .tint(.white)
                }
                .frame(width:40, height: 40)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                .offset(y: 150 / 2)
            }
        }
        
        VStack(alignment: .leading) {
            Text("닉네임")
                .fontWeight(.bold)
            TextField("닉네임을 입력하세요.", text: $textField)
                .font(.title3)
                .multilineTextAlignment(.leading)
                
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.2), lineWidth: 2)
                }
            
            Spacer()
            

        }
        .padding()
        .navigationTitle("프로필 변경")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Text("완료")
                }
                .disabled(textField.count <= 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileSettingView()
    }
}
