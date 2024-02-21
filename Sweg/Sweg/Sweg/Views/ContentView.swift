//
//  ContentView.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 1
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            InquiryView(selectedTabIndex: $selectedIndex)
                .tabItem {
                    Label("조회/납부", systemImage: "wonsign.circle")
                }
                .tag(1)
            SectionView()
                .tabItem {
                    Label("공과금 비교", systemImage: "chart.pie.fill")
                }
                .tag(2)
            BoardView()
                .tabItem {
                    Label("핵꿀팁 게시판", systemImage: "person.3.fill")
                }
                .tag(3)
            MoreSettingsView()
                .tabItem {
                    Label("더보기", systemImage: "ellipsis.circle")
                }
                .tag(4)
        }
    }
}

#Preview {
    ContentView()
}
