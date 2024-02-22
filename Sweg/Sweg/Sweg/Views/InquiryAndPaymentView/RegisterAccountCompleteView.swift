//
//  RegisterAccountCompleteView.swift
//  Sweg
//
//  Created by 김성민 on 2/22/24.
//

import SwiftUI

struct RegisterAccountCompleteView: View {
    @Binding var isShowingPaymentWayView: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .padding()
                .foregroundStyle(.accent)
            Text("자동이체 계좌 등록 완료")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            Group {
                Text("매달 1일 ")
                Text("공과금이 납부됩니다.")
            }
            .foregroundStyle(Color(uiColor: .systemGray))
            Spacer()
            
            Button {
                isShowingPaymentWayView.toggle()
            } label: {
                Text("확인")
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.3)
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
                    .background(.accent)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RegisterAccountCompleteView(isShowingPaymentWayView: .constant(false))
}
