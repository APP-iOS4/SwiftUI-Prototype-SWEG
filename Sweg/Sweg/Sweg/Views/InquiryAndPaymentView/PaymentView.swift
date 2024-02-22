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
    
    @Binding var isShowingPaymentWayView: Bool
    
    var body: some View {
        Form {
            Section {
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("2024년 2월")
                                .fontWeight(.semibold)
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
                            Text("18㎥")
                                .font(.caption)
                            Spacer()
                            Text("20,200원")
                        }
                        HStack {
                            Text("⚡️ 전기 요금")
                            Text("93kWh")
                                .font(.caption)
                            Spacer()
                            Text("11,200원")
                        }
                        HStack {
                            Text("🔥 가스 요금")
                            Text("15㎥")
                                .font(.caption)
                            Spacer()
                            Text("9,960원")
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                }
            }
            
            Section {
                HStack {
                    Text("예금주명")
                    Spacer()
                    Text("이제용")
                        .fontWeight(.semibold)
                }
                
                HStack {
                    Text("은행명")
                    Spacer()
                    Text("신한은행")
                        .fontWeight(.semibold)
                }
                
                HStack {
                    Text("계좌번호")
                    Spacer()
                    Text("110115489445")
                        .fontWeight(.semibold)
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
            
            예금주: 이제용
            은행명: 신한은행
            계좌번호: 110115489445
            """)
        }
        .navigationDestination(isPresented: $isShowingPaymentCompletedView) {
            PaymentCompleteView(isShowingPaymentWayView: $isShowingPaymentWayView)
        }
    }
}

#Preview {
    NavigationStack {
        PaymentView(isShowingPaymentWayView: .constant(false))
    }
}
