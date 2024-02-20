//
//  Tab3ButtonDesign.swift
//  Sweg
//
//  Created by 심소영 on 2/20/24.
//

import SwiftUI

struct Tab3ButtonDesign: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.yellow)
                .frame(width: 360, height: 200)
            Text("나를 눌러줘!")
                .foregroundColor(.red)
        }
    }
}
