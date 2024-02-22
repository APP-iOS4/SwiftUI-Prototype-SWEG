//
//  PaymentCompleteView.swift
//  Sweg
//
//  Created by 김성민 on 2/21/24.
//

import SwiftUI

struct PaymentCompleteView: View {
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
            Text("41,360원")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            Group {
                Text("2024년 2월 공과금")
                Text("납부가 완료되었습니다.")
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
    PaymentCompleteView(isShowingPaymentWayView: .constant(false))
}
