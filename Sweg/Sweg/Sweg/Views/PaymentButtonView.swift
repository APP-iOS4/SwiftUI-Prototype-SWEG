//
//  PaymentButtonView.swift
//  Sweg
//
//  Created by 김성민 on 2/21/24.
//

import SwiftUI

struct PaymentButtonView: View {
    var imageString: String
    var message: String
    
    var body: some View {
        HStack {
            Image("\(imageString)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
            Text("\(message)")
        }
    }
}

#Preview {
    PaymentButtonView(imageString: "kakaopay", message: "카카오페이")
}
