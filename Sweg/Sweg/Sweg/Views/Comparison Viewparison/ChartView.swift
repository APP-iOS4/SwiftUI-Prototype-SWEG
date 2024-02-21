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
            Text("요금별 차트")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack {
                Chart {
                    // 임시 세대 평균 요금 차트
                    ForEach(chartDummyData) { data2 in
                            BarMark(
                                x: .value("목록", data2.type),
                                y: .value("원", data2.amount),
                                stacking: .unstacked
                             
                            )
                        }
                    .foregroundStyle(.green)
                    
                    // 사용자 요금 차트
                    
                    ForEach(monthlyUtilityStore.chartData) { data in
                            BarMark(
                                x: .value("목록", data.type),
                                y: .value("원", data.amount),
                                stacking: .unstacked
                                
                            )
                        }
                    
              
                    
                }
                .chartForegroundStyleScale([
                    "사용자 납부금": .accent, "세대 평균 납부금": .orange
                ])
             
            }
        }
        .padding(20)
        
        
        VStack(alignment: .center) {
            // total
            Text("사용자님의 평균 납부 금액은 \(monthlyUtilityStore.chartData.reduce(0) { $0 + $1.amount })입니다.")

        }
       
    }
}
#Preview {
    ChartView()
}
