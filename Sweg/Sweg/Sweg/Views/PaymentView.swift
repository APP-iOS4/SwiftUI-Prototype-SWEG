//
//  PaymentView.swift
//  Sweg
//
//  Created by 김성민 on 2/20/24.
//

import SwiftUI

struct PaymentView: View {
    @State private var selectedBank: BankType = .nh
    @State private var bankAccountNumber: String = ""
    
    @State private var isShowSheet: Bool = false
    
    var body: some View {
        Form {
            Section {
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("2024년 2월 청구금액")
                            Spacer()
                        }
                        Text("24. 2. 1 ~ 24. 2. 29")
                            .font(.caption)
                    }
                    
                    HStack {
                        Spacer()
                        Text("41,360원")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    
                    Grid(verticalSpacing: 10) {
                        HStack {
                            Text("💧 수도 요금")
                            Spacer()
                            Text("20,200원")
                        }
                        HStack {
                            Text("⚡️ 전기 요금")
                            Spacer()
                            Text("11,200원")
                        }
                        HStack {
                            Text("🔥 가스 요금")
                            Spacer()
                            Text("9,960원")
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
            }
            
            Section {
                Button {
                    isShowSheet.toggle()
                } label: {
                    Text("테스트")
                }
                .sheet(isPresented: $isShowSheet) {
                    ChangePaymentView()
                }
                
                HStack {
                    Text("예금주명")
                    Spacer()
                    Text("김마루")
                }
                Picker("은행명", selection: $selectedBank) {
                    Text("농협").tag(BankType.nh)
                    Text("신한").tag(BankType.shinhan)
                    Text("토스").tag(BankType.toss)
                }
                .tint(.primary)
                HStack {
                    Text("계좌번호")
                    Spacer()
                    TextField("숫자만 입력", text: $bankAccountNumber)
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(.plain)
                        .keyboardType(.decimalPad)
                        .onAppear {
                            UITextField.appearance().clearButtonMode = .whileEditing
                        }
                }
            }
            
            Section {
                HStack {
                    Text("예금주명")
                    Text("김마루")
                }
            }
        }
    }
}

#Preview {
    PaymentView()
}
