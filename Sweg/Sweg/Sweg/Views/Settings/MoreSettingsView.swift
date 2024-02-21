//
//  MoreSettingsView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct MoreSettingsView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ProfileInfoView()
                        .padding(.bottom, 20)
                    
                    SettingButtonView(buttonType: .notice)
                    
                    Text("설정")
                        .font(.body)
                        .foregroundStyle(.gray)
                        .padding(.top, 20)
                    SettingButtonView(buttonType: .pay)
                    SettingButtonView(buttonType: .notification)
                    SettingButtonView(buttonType: .lock)
    
                    Text("서비스 동의")
                        .font(.body)
                        .foregroundStyle(.gray)
                        .padding(.top, 20)
                    SettingButtonView(buttonType: .terms)
                    SettingButtonView(buttonType: .policy)
                    
                    Text("앱 정보")
                        .font(.body)
                        .foregroundStyle(.gray)
                        .padding(.top, 20)
                    SettingButtonView(buttonType: .version)
                    SettingButtonView(buttonType: .reset)
                    
                    Button {
                        
                    } label: {
                        Text("로그아웃")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .foregroundStyle(.primary)
                    .padding(.top, 30)
                }
                .padding()

            }
            .padding(.zero)
            .scrollContentBackground(.hidden)
            .navigationTitle("더보기")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    MoreSettingsView()
}
