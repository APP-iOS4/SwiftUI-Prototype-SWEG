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
    @State private var isNavigationNoticeBoard: Bool = false
    @State private var isNavigationTerm: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    didTapButton()
                } label: {
                    Text("\(buttonType.rawValue)")
                        .font(.title3)
                    
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
                    } else {
                        Spacer()
                    }
                }
                .tint(.primary)
            }
            .padding(.vertical, 10)
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.1))
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
        .navigationDestination(isPresented: $isNavigationDestination) {
            SettingWithToggleView(settingType: buttonType)
        }
        .navigationDestination(isPresented: $isNavigationNoticeBoard) {
            NoticeBoardView()
        }
        .navigationDestination(isPresented: $isNavigationTerm) {
            TermView(isTerm: buttonType == .terms ? true : false)
        }
    }
    
    private func didTapButton() {
        switch buttonType {
        case .pay, .notification, .lock:
            isNavigationDestination.toggle()
        case .terms:
            isNavigationTerm.toggle()
        case .policy:
            isNavigationTerm.toggle()
        case .version:
            break
        case .reset:
            break
        case .notice:
            isNavigationNoticeBoard.toggle()
        }
    }
}

#Preview {
    SettingButtonView(buttonType: .notice)
}
