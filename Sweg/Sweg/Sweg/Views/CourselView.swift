//
//  CourselView.swift
//  Sweg
//
//  Created by 홍승표 on 2/20/24.
//

import SwiftUI

struct CourselView: View {
    let pageTest = ["수도세", "전기세", "가스비"]
    private var monthlyUtilityStore = MonthlyUtilityStore()
    
    @State private var currentPage = 0
    var body: some View {
        TabView {
            ForEach(pageTest, id: \.self) { pageTest in
                Text(pageTest)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .frame(height: 300)
        .tabViewStyle(.page)
        
//        VStack {
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 20) {
//                    ForEach(pageTest, id: \.self) { pageTest in
//                        Text(pageTest)
//                            .font(.title)
//                            .foregroundColor(.white)
//                            .frame(width: 350, height: 200)
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                }
//                .padding()
//            }
//            
//            PageControl(numberOfPages: pageTest.count, currentPage: $currentPage)
//                .padding()
//        }
    }
}

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        pageControl.tintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

#Preview {
    CourselView()
}
