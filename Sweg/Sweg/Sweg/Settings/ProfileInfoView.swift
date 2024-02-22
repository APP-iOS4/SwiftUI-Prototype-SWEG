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
        HStack(spacing: 20) {
            Image("profileImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 80)
                
            Text("이제용")
                .font(.title2)
            
            Spacer()
            
            Button {
                isNavigationDestination.toggle()
            } label: {
                Text("변경")
            }
            .tint(.primary)
        }
        .padding(.horizontal)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .navigationDestination(isPresented: $isNavigationDestination) {
            ProfileSettingView()
        }
    }
}

#Preview {
    ProfileInfoView()
}
