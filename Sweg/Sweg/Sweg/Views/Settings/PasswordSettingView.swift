//
//  PasswordSettingView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct PasswordSettingView: View {
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("appPassword") private var appPassword: String = "-1111"
    @AppStorage("\(ToggleSettingType.useAppLock)") private var useAppLock: Bool = false
    
    @State private var inputPassword: [Int] = []
    @State private var inputRePassword: [Int] = []
    
    private let passwordNumbers = Array(1...9) + [-1, 0, -2]
    private var gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    private var changeTitle: String {
        if inputPassword.count < 4 {
            return "비밀번호를 입력해주세요."
        } else {
            return "한번 더 입력해주세요."
        }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("\(changeTitle)")
            HStack(spacing: 20) {
                ForEach(0..<4, id: \.self) { i in
                    Circle()
                        .frame(height: 20)
                        .foregroundStyle(isDigitsPassword(index: i) ? .accent : .gray)
                }
            }
            
            Spacer()
            LazyVGrid(columns: gridItems, alignment: .center) {
                ForEach(passwordNumbers, id: \.self) { number in
                    if number < 0 {
                        Text("")
                    } else {
                        Button {
                            didTapNumberButton(number: number)
                        } label: {
                            Text("\(number)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .tint(.primary)
                    }
                }
            }
            
        }
        .navigationTitle("비밀번호 변경")
        .onDisappear {
            if appPassword == "-1111" {
                useAppLock = false
            }
        }
    }
    
    private func isDigitsPassword(index: Int) -> Bool {
        if inputPassword.count < 4 {
            return index < inputPassword.count
        } else {
            return index < inputRePassword.count
        }
    }
    
    private func didTapNumberButton(number: Int) {
        if inputPassword.count < 4 {
            inputPassword.append(number)
        } else {
            inputRePassword.append(number)
            // 다시 입력 창에서 비밀번호를 모두 입력 했을때
            if inputRePassword.count >= 4 {
                appPassword = inputRePassword.map { String($0) }.joined()
                dismiss.callAsFunction()
            }
        }
    }
}

#Preview {
    NavigationStack {
        PasswordSettingView()
            .navigationBarTitleDisplayMode(.inline)
    }
}
