//
//  SettingButtonView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct SettingButtonView: View {
    
    var buttonType: SettingMenuType
    
    @State private var isNavigationDestination: Bool = false
    
    var body: some View {
        HStack {
            Button {
                didTapButton()
            } label: {
                Text("\(buttonType.rawValue)")
                    .font(.title3)
            }
            .tint(.primary)
            
            if buttonType == .version {
                Text("v1.0.0")
                    .font(.body)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("업데이트")
                        .font(.body)
                        .underline()
                }
                .tint(.gray)
            }
        }
        .navigationDestination(isPresented: $isNavigationDestination) {
            SettingWithToggleView(settingType: buttonType)
        }
    }
    
    private func didTapButton() {
        switch buttonType {
        case .pay, .notification, .lock:
            isNavigationDestination.toggle()
        case .terms:
            break
        case .policy:
            break
        case .version:
            break
        case .reset:
            break
        case .notice:
            break
        }
    }
}

#Preview {
    SettingButtonView(buttonType: .version)
}
