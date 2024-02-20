//
//  InquiryView.swift
//  Sweg
//
//  Created by 김성민 on 2/20/24.
//

import SwiftUI

struct InquiryView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ThisMonthUtilityView()
                }
                
                Section {
                    YearOnYearView()
                }
                
                Section {
                    LastThreeMonthlyUtiliesView()
                }
            }
            .listSectionSpacing(25)
        }
    }
}

#Preview {
    InquiryView()
}

struct ThisMonthUtilityView: View {
    var monthlyUtilityStore = MonthlyUtilityStore()
    
    private var yearOfThisMonth: String { monthlyUtilityStore.monthlyUtilities.last?.yearString ?? "" }
    private var thisMonth: Int { monthlyUtilityStore.monthlyUtilities.last?.month ?? 0 }
    private var waterBill: Int { monthlyUtilityStore.monthlyUtilities.last?.utility.water ?? 0 }
    private var electricityBill: Int { monthlyUtilityStore.monthlyUtilities.last?.utility.electricity ?? 0 }
    private var gasBill: Int { monthlyUtilityStore.monthlyUtilities.last?.utility.gas ?? 0 }
    private var totalBill: Int { monthlyUtilityStore.monthlyUtilities.last?.utility.total ?? 0 }
    
    @State var isShowingPaymentWayView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(yearOfThisMonth)년 \(thisMonth)월 청구금액")
                        Spacer()
                    }
                    Text("24. 2. 1 ~ 24. 2. 29")
                        .font(.caption)
                }
                
                HStack {
                    Spacer()
                    Text("\(totalBill)원")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.bottom)
                }
                
                Grid(verticalSpacing: 10) {
                    HStack {
                        Text("💧 수도 요금")
                        Spacer()
                        Text("\(waterBill)원")
                    }
                    HStack {
                        Text("⚡️ 전기 요금")
                        Spacer()
                        Text("\(electricityBill)원")
                    }
                    HStack {
                        Text("🔥 가스 요금")
                        Spacer()
                        Text("\(gasBill)원")
                    }
                }
                .padding(.leading)
                .padding(.trailing)
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isShowingPaymentWayView.toggle()
                    }, label: {
                        Text("납부하기")
                    })
                    .buttonStyle(.bordered)
                    
                }
                .padding(.top)
                Spacer()
            }
        }
        .sheet(isPresented: $isShowingPaymentWayView) {
            NavigationStack {
                Form {
                    Section {
                        NavigationLink {
                            PaymentView()
                        } label: {
                            Text("카카오페이로 납부하기")
                        }
                        NavigationLink {
                            PaymentView()
                        } label: {
                            Text("나의 계좌에서 바로 납부하기")
                        }
                        NavigationLink {
                            PaymentView()
                        } label: {
                            Text("입금 전용계좌 문자 안내받기")
                        }
                        NavigationLink {
                            PaymentView()
                        } label: {
                            Text("카카오페이로 납부하기")
                        }
                    }
                    
                    Button(role: .destructive, action: {
                        isShowingPaymentWayView.toggle()
                    }, label: {
                        Text("납부 취소하기")
                    })
                }
                .navigationTitle("납부 방법 선택하기")
                .navigationBarTitleDisplayMode(.inline)
            }
            .interactiveDismissDisabled()
        }
    }
}

struct YearOnYearView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("전년동월비")
                    Spacer()
                }
                Text("23. 2. 1 ~ 23. 2. 29")
                    .font(.caption)
            }
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("10.4% 증가했어요")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    Text("37,450원")
                }
            }
        }
    }
}

struct LastThreeMonthlyUtiliesView: View {
    var monthlyUtilityStore = MonthlyUtilityStore()
    
    private var yearOfLastMonth: String { monthlyUtilityStore.monthlyUtilities.dropLast().last?.yearString ?? "" }
    private var lastMonth: Int { monthlyUtilityStore.monthlyUtilities.dropLast().last?.month ?? 0 }
    private var billOfLastMonth: Int { monthlyUtilityStore.monthlyUtilities.dropLast().last?.utility.total ?? 0 }
    
    private var yearOfTwoMonthsAgo: String { monthlyUtilityStore.monthlyUtilities.dropLast().dropLast().last?.yearString ?? "" }
    private var TwoMonthsAgo: Int { monthlyUtilityStore.monthlyUtilities.dropLast().dropLast().last?.month ?? 0 }
    private var billOfTwoMonthsAgo: Int { monthlyUtilityStore.monthlyUtilities.dropLast().dropLast().last?.utility.total ?? 0 }
    
    private var yearOfThreeMonthsAgo: String { monthlyUtilityStore.monthlyUtilities.dropLast().dropLast().dropLast().last?.yearString ?? "" }
    private var ThreeMonthsAgo: Int { monthlyUtilityStore.monthlyUtilities.dropLast().dropLast().dropLast().last?.month ?? 0 }
    private var billOfThreeMonthsAgo: Int { monthlyUtilityStore.monthlyUtilities.dropLast().dropLast().dropLast().last?.utility.total ?? 0 }
    
    var body: some View {
        Group {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(yearOfLastMonth)년 \(lastMonth)월 청구금액")
                        Spacer()
                    }
                    Text("24. 1. 1 ~ 24. 1. 31")
                        .font(.caption)
                }
                HStack {
                    Spacer()
                    Text("\(billOfLastMonth)원")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                }
            }
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(yearOfTwoMonthsAgo)년 \(TwoMonthsAgo)월 청구금액")
                        Spacer()
                    }
                    Text("23. 12. 1 ~ 23. 12. 31")
                        .font(.caption)
                }
                HStack {
                    Spacer()
                    Text("\(billOfTwoMonthsAgo)원")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                }
            }
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(yearOfThreeMonthsAgo)년 \(ThreeMonthsAgo)월 청구금액")
                        Spacer()
                    }
                    Text("23. 11. 1 ~ 23. 11. 30")
                        .font(.caption)
                }
                HStack {
                    Spacer()
                    Text("\(billOfThreeMonthsAgo)원")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                }
            }
        }
    }
}
