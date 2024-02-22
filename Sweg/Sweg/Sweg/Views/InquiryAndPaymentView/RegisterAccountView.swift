//
//  RegisterAccountView.swift
//  Sweg
//
//  Created by 김성민 on 2/22/24.
//

import SwiftUI

struct RegisterAccountView: View {
    @Environment (\.dismiss) private var dismiss
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var selectedBank: BankType?
    @State private var bankAccountField: String = ""
    @State private var isShowingPaymentCompletedView: Bool = false
    @Binding var isShowingPaymentWayView: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("자동이체 계좌 등록")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .tint(.primary)
            .font(.title3)
            .fontWeight(.bold)
            
            Spacer()
            
            LazyVGrid(columns: gridItems) {
                ForEach(BankType.allCases, id: \.self) { bank in
                    BankButtonView(bank: bank, isSelected: buttonSelected(bank))
                        .onTapGesture {
                            selectedBank = bank
                        }
                }
            }
            
            TextField("계좌번호를 입력하세요", text: $bankAccountField)
                .keyboardType(.decimalPad)
                .font(.title2)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.2), lineWidth: 2)
                }
                .padding(.vertical)
            
            Button {
                isShowingPaymentCompletedView.toggle()
            } label: {
                Text("확인")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
                    .background(.accent)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .sheet(isPresented: $isShowingPaymentCompletedView, content: {
            RegisterAccountCompleteView(isShowingPaymentWayView: $isShowingPaymentWayView)
        })
    }
    
    private func buttonSelected(_ bank: BankType) -> Bool {
        guard let selectedBank = selectedBank else { return false }
        return bank == selectedBank
    }
}

#Preview {
    RegisterAccountView(isShowingPaymentWayView: .constant(false))
}
