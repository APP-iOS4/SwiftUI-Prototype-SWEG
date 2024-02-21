//
//  ChangePaymentView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct ChangePaymentView: View {
    @Environment (\.dismiss) private var dismiss
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var selectedBank: BankType?
    @State private var bankAccountField: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("납부정보 변경")
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
                .font(.title2)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.2), lineWidth: 2)
                }
                .padding(.vertical)
            
            Button {
                
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
    }
    
    private func buttonSelected(_ bank: BankType) -> Bool {
        guard let selectedBank = selectedBank else { return false }
        return bank == selectedBank
    }
}

#Preview {
    ChangePaymentView()
}


