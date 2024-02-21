//
//  SecionView.swift
//  Sweg
//
//  Created by 홍승표 on 2/20/24.
//

import SwiftUI

struct SectionView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("요금별 차트 비교") {
                    ChartView()
                }
                
                Section("사용자 납부액 비교") {
                    RankingView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("공과금 비교")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
        }
        
    }
    
}

#Preview {
    SectionView()
}
