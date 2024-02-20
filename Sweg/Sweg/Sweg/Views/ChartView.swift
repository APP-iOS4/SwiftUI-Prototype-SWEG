//
//  ChartView.swift
//  Sweg
//
//  Created by 홍승표 on 2/20/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    private var monthlyUtilityStore = MonthlyUtilityStore()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("이번달 현황")
                .font(.title)
                .padding()

            
        }
    }
}

#Preview {
    ChartView()
}
