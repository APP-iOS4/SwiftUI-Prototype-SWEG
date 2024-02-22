//
//  ProfileInfoView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct ProfileInfoView: View {
    @State private var isNavigationDestination: Bool = false
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image("profileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 60)
                
                Text("이제용")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            Button {
                isNavigationDestination.toggle()
            } label: {
                Text("프로필 수정")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.gray.opacity(0.2))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .navigationDestination(isPresented: $isNavigationDestination) {
            ProfileSettingView()
        }
    }
}

#Preview {
    ProfileInfoView()
}
