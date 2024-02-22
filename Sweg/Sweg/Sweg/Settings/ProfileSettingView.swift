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
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250)
                    .background(.gray)
                    .clipShape(Circle())
                
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "photo")
                            .font(.title)
                    }
                    .tint(.white)
                }
                .frame(width:50, height: 50)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                .offset(y: 250 / 2)
            }
        }
        
        VStack {
            TextField("닉네임을 입력하세요.", text: $textField)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.2), lineWidth: 2)
                    
                }
            
            Spacer()
            
            Button {
                dismiss.callAsFunction()
            } label: {
                Text("확인")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
                    .background(.accent)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .navigationTitle("프로필 변경")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProfileSettingView()
    }
}
