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
            Text("요금별 평균 비용 차트")
                .font(.title2)
                .fontWeight(.bold)
            Text("동일 평수 세대의 사용자 평균 비용 차트")
                .font(.subheadline)
                .foregroundStyle(.gray)
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
                    "이제용 님": .accent, "동일 평수 세대": .green
                ])
             
            }
            .frame(height: 200)
        }
        .padding(20)
        
        
        VStack(alignment: .center) {
            // total
            Text("사용자님의 평균 납부 금액은 \(monthlyUtilityStore.chartData.reduce(0) { $0 + $1.amount })입니다.")
                .frame(maxWidth: .infinity, alignment: .center)

        }
       
    }
}
#Preview {
    ChartView()
}
