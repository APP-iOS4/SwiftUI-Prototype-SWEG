//
//  RankingView.swift
//  Sweg
//
//  Created by 홍승표 on 2/20/24.
//

import SwiftUI

struct RankingView: View {
    private var monthlyUtilityStore = MonthlyUtilityStore()
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 30) {
            
            Text("납부액 비교")
                .font(.title2)
                .fontWeight(.bold)
            
            //최소 납부 요금 기록
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("최소 납부하신 공과금")
                        .font(.headline)
                }
                
                if let minUtility = monthlyUtilityStore.minUtility {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text ("10월")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("23. 10. 1 ~ 23. 10. 31")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        Text("\(minUtility.utility.total)원")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    
                    Grid(verticalSpacing: 10) {
                        HStack {
                            Text("\(UtilityType.water.rawValue)")
                            Spacer()
                            Text("\(minUtility.utility.water)원")
                        }
                        HStack {
                            Text("\(UtilityType.electricity.rawValue)")
                            Spacer()
                            Text("\(minUtility.utility.electricity)원")
                        }
                        HStack {
                            Text("\(UtilityType.gas.rawValue)")
                            Spacer()
                            Text("\(minUtility.utility.gas)원")
                        }
                    }
                }
                 
            }
           
        
        
            Divider()
            
            // 최대 납부 요금 기록
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("최대 납부하신 공과금")
                        .font(.headline)
                }

                if let maxUtility = monthlyUtilityStore.maxUtility {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text ("2월")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("24. 2. 1 ~ 24. 2. 29")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        Text("\(maxUtility.utility.total)원")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    
                    Grid(verticalSpacing: 10) {
                        HStack {
                            Text("\(UtilityType.water.rawValue)")
                            Spacer()
                            Text("\(maxUtility.utility.water)원")
                        }
                        HStack {
                            Text("\(UtilityType.electricity.rawValue)")
                            Spacer()
                            Text("\(maxUtility.utility.electricity)원")
                        }
                        HStack {
                            Text("\(UtilityType.gas.rawValue)")
                            Spacer()
                            Text("\(maxUtility.utility.gas)원")
                        }
                    }
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    RankingView()
}
