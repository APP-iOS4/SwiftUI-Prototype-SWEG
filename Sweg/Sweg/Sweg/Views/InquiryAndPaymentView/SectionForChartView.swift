//
//  SectionForChart.swift
//  Sweg
//
//  Created by 김성민 on 2/21/24.
//

import SwiftUI

struct SectionForChartView: View {
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("다른 사람들의 수도 요금이 궁금해?")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("이웃의 평균 공과금을 알려드려요")
                    .font(.subheadline)
                HStack {
                    Spacer()
                    Image(systemName: "building.2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55)
                        .foregroundStyle(.accent)
                        .padding(.top, -20)
                        .padding(.trailing, 1)
                }
            }
            
            HStack {
                Spacer()
                Button(action: {
                    selectedTabIndex = 2
                }, label: {
                    HStack {
                        Text("비교하러 가기")
                        Image(systemName: "chevron.right")
                    }
                    .font(.subheadline)
                })
                .tint(.primary)
            }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color(.sectioncolor1))
    }
}

#Preview {
    SectionForChartView(selectedTabIndex: .constant(2))
}
