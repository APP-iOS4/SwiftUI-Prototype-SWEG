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
    
    @State private var isShowingChangeAccountSheet: Bool = false
    @State private var isShowingPaymentCompletedView: Bool = false
    @State private var isShowingCheckingAlert: Bool = false
    
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
                HStack {
                    Text("예금주명")
                    Spacer()
                    Text("김마루")
                }
                
                HStack {
                    Text("은행명")
                    Spacer()
                    Text("신한은행")
                }
                
                HStack {
                    Text("계좌번호")
                    Spacer()
                    Text("110115489445")
                }
                
                HStack {
                    Spacer()
                    Button {
                        isShowingChangeAccountSheet.toggle()
                    } label: {
                        Text("납부정보 변경")
                    }
                    .sheet(isPresented: $isShowingChangeAccountSheet) {
                        ChangePaymentView()
                    }
                    Spacer()
                }
            }
            
            Section {
                Button(action: {
                    isShowingCheckingAlert.toggle()
                    print("요금이 납부되었습니다.")
                }, label: {
                    HStack {
                        Spacer()
                        Text("납부하기")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                })
                .listRowBackground(Color.accent)
            }
        }
        .alert("납부하시겠습니까?", isPresented: $isShowingCheckingAlert) {
            Button("납부") {
                isShowingPaymentCompletedView = true
            }
            Button("취소", role: .cancel) {
                
            }
        } message: {
            Text("""
            
            예금주: 김마루
            은행명: 신한은행
            계좌번호: 110115489445
            """)
        }
        .navigationDestination(isPresented: $isShowingPaymentCompletedView) {
            Text("납부가 완료되었습니다.")
            Text("(화면 좀 더 꾸미고, 홈으로 돌아가야 함!)")
        }
    }
}

#Preview {
    NavigationStack {
        PaymentView()
    }
}
