//
//  ProfileInfoView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct ProfileInfoView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image("profileImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 80)
                
            Text("닉네임")
                .font(.title2)
            
            Spacer()
            
            Button {
                print("변경 버튼 눌림")
            } label: {
                Text("변경")
            }
            .tint(.primary)
        }
    }
}

#Preview {
    ProfileInfoView()
}
