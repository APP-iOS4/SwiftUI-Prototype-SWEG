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
            NavigationStack {
                List {
                    ForEach(monthlyUtilityStore.monthlyTotalSorted.indices) { index in
                        let rank = index + 1
                        let monthlyUtility = monthlyUtilityStore.monthlyTotalSorted[index]
                        HStack {
                            Text("\(rank)등")
                                .font(.title)
                            
                            Spacer()
                            
                            Text("\(monthlyUtility.utility.total)원")
                                .font(.subheadline)
                            
                        }
                    }
                }
                .navigationTitle("명예의 전당")
            }
    }
    
}


#Preview {
    RankingView()
}
