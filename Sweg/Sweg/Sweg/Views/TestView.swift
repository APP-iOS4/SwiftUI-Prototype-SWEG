//
//  SecionView.swift
//  Sweg
//
//  Created by 홍승표 on 2/20/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ScrollView {
            ChartView()
            CourselView()
            RankingView()
        }
    }
}

#Preview {
    TestView()
}
