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
            List {
                ProfileInfoView()
                .listRowInsets(EdgeInsets())
                
                Section {
                    SettingButtonView(buttonType: .notice)
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                
                Section("설정") {
                    SettingButtonView(buttonType: .pay)
                    SettingButtonView(buttonType: .notification)
                    SettingButtonView(buttonType: .lock)
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                
                Section("서비스 동의") {
                    SettingButtonView(buttonType: .terms)
                    SettingButtonView(buttonType: .policy)
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                
                Section("앱 정보") {
                    SettingButtonView(buttonType: .version)
                    SettingButtonView(buttonType: .reset)
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .scrollContentBackground(.hidden)
                
                Button {
                    
                } label: {
                    Text("로그아웃")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .foregroundStyle(.black)
            }
            .padding(.zero)
            .background(.clear)
            .scrollContentBackground(.hidden)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("더보기")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
        }
    }
}


#Preview {
    MoreSettingsView()
}
