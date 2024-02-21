//
//  BankButtonView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct BankButtonView: View {
    var bank: BankType
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image("\(bank)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            Spacer()
            Text("\(bank.rawValue)")
                .padding(.leading, 10)
            Spacer()            
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: 40)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            if isSelected {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.accent, lineWidth: 1)
            }
        }
    }
}

#Preview {
    BankButtonView(bank: .toss, isSelected: true)
}
