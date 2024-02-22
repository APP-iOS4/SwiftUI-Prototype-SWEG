//
//  AdView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct AdView: View {
    private let ads = ["naverAD", "naverMembershipAD", "samsungAD"]
    @State private var randomAdCount: Int = 0
    
    var body: some View {
        Image("\(ads[randomAdCount])")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onAppear {
                randomAdCount = Int.random(in: 0..<ads.count)
            }
    }
}

#Preview {
    AdView()
}
