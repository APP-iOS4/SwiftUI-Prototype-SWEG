//
//  SettingWithToggleView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct SettingWithToggleView: View {
    @AppStorage("\(ToggleSettingType.autoPaySetting)") private var autoPaySetting: Bool = false
    @AppStorage("\(ToggleSettingType.newPostNotification)") private var newPostNotification: Bool = false
    @AppStorage("\(ToggleSettingType.paidNotification)") private var paidNotification: Bool = false
    @AppStorage("\(ToggleSettingType.serviceNotification)") private var serviceNotification: Bool = false
    @AppStorage("\(ToggleSettingType.useAppLock)") private var useAppLock: Bool = false
    @AppStorage("\(ToggleSettingType.useFaceId)") private var useFaceId: Bool = false
    @AppStorage("appPassword") private var appPassword: String = "-1111"
    
    @State private var isPasswordChangeNavigationDestination: Bool = false
    @State private var isShowingChangePaymentSheet: Bool = false
    
    var settingType: SettingMenuType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            switch settingType {
            case .pay:
                HStack {
                    Text("납부정보 변경")
                    Spacer()
                    Text("신한은행 110-***-**7005")
                        .font(.caption)
                }
                .sheet(isPresented: $isShowingChangePaymentSheet) {
                    ChangePaymentView()
                        .presentationDetents([.large])
                        .interactiveDismissDisabled()
                }
                .onTapGesture {
                    isShowingChangePaymentSheet.toggle()
                }
                
                Toggle("\(ToggleSettingType.autoPaySetting.rawValue)", isOn: $autoPaySetting)
            case .notification:
                Toggle("\(ToggleSettingType.paidNotification.rawValue)", isOn: $paidNotification)
                Toggle("\(ToggleSettingType.newPostNotification.rawValue)", isOn: $newPostNotification)
                Toggle("\(ToggleSettingType.serviceNotification.rawValue)", isOn: $serviceNotification)
            case .lock:
                Toggle("\(ToggleSettingType.useAppLock.rawValue)", isOn: $useAppLock)
                    .onChange(of: useAppLock) {
                        if useAppLock == false {
                            appPassword = "-1111"
                            return
                        }
                        if appPassword == "-1111" {
                            isPasswordChangeNavigationDestination.toggle()
                        }
                    }
                
                if appPassword != "-1111" {
                    Button {
                        isPasswordChangeNavigationDestination.toggle()
                    } label: {
                        Text("비밀번호 변경")
                    }
                    .tint(.primary)
                }

                Toggle("\(ToggleSettingType.useFaceId.rawValue)", isOn: $useFaceId)
            default:
                Text("잘못 된 접근입니다.")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("\(settingType.rawValue)")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $isPasswordChangeNavigationDestination) {
            PasswordSettingView()
        }
    }
}

#Preview {
    NavigationStack {
        SettingWithToggleView(settingType: .pay)
    }
}
