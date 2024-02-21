////
////  CourselView.swift
////  Sweg
////
////  Created by 홍승표 on 2/20/24.
////
//
//import SwiftUI
//
//struct CourselView: View {
//    private var monthlyUtilityStore = MonthlyUtilityStore()
//
//    
//    var body: some View {
//        TabView {
//            VStack {
//                Text("\(monthlyUtilityStore.utilityText(type: .water, monthlyUtility: monthlyUtilityStore.monthlyTotalSorted[0]))")
//                    
//                    .styleSet()
//            }
//            
//            VStack {
//                Text("\(monthlyUtilityStore.utilityText(type: .electricity, monthlyUtility: monthlyUtilityStore.monthlyTotalSorted[0]))")
//                    
//                    .styleSet()
//            }
//            
//            VStack {
//                Text("\(monthlyUtilityStore.utilityText(type: .gas, monthlyUtility: monthlyUtilityStore.monthlyTotalSorted[0]))")
//                    
//                    .styleSet()
//                
//            }
//            
//            VStack {
//                Text("\(monthlyUtilityStore.utilityText(type: .total, monthlyUtility: monthlyUtilityStore.monthlyTotalSorted[0]))")
//                    
//                    .styleSet()
//            }
//        }
//        .frame(height: 300)
//        .tabViewStyle(.page)
//    }
//}
//
//private extension Text {
//    func styleSet() -> some View {
//        self
//            .font(.title)
//            .foregroundColor(.white)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.blue)
//            .cornerRadius(10)
//            .padding()
//    }
//}
//#Preview {
//    CourselView()
//}
