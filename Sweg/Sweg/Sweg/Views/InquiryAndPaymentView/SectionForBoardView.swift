//
//  SectionForBoardView.swift
//  Sweg
//
//  Created by 김성민 on 2/21/24.
//

import SwiftUI

struct SectionForBoardView: View {
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("가스 요금 올랐다던데 🥲")
                    .font(.subheadline)
                Text("가스 요금 절약 어떻게 하면 좋을까")
                    .font(.title3)
                    .fontWeight(.bold)
                HStack {
                    Spacer()
                    Image("gasshock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110)
                        .foregroundStyle(.accent)
                        .padding(.bottom, -10)
                        //.padding(.leading, 30)
                    Spacer()
                }
            }
            
            HStack {
                Spacer()
                Button(action: {
                    selectedTabIndex = 3
                }, label: {
                    HStack {
                        Text("꿀팁 공유받기")
                        Image(systemName: "chevron.right")
                    }
                    .font(.subheadline)
                })
                .tint(.primary)
            }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color(.sectioncolor2))
    }
}

#Preview {
    SectionForBoardView(selectedTabIndex: .constant(3))
}
