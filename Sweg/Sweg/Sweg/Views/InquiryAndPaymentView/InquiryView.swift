//
//  InquiryView.swift
//  Sweg
//
//  Created by 김성민 on 2/20/24.
//

import SwiftUI

struct InquiryView: View {
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        NavigationStack {
            List {
                Section("이번 달 공과금") {
                    ThisMonthUtilityView()
                }
                
                Section {
                    YearOnYearView()
                }
                
                Section("최근 3개월 공과금") {
                    LastThreeMonthlyUtiliesView()
                }
                
                Section {
                    SectionForChartView(selectedTabIndex: $selectedTabIndex)
                }
                
                Section {
                    SectionForBoardView(selectedTabIndex: $selectedTabIndex)
                }
            }
            .navigationTitle("조회 및 납부")
            .navigationBarTitleDisplayMode(.inline)
            .listSectionSpacing(20)
        }
    }
}

#Preview {
    InquiryView(selectedTabIndex: .constant(1))
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
    @State var isShowingChangeAccountSheet: Bool = false
    
    var body: some View {
        VStack {
            Grid {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(yearOfThisMonth)년 \(thisMonth)월")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        Text("24. 2. 1 ~ 24. 2. 29")
                            .font(.caption)
                    }
                }
            }
            
            HStack {
                Spacer()
                Text("\(totalBill)원")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 1)
                    .padding(.bottom)
            }
            
            Grid(verticalSpacing: 10) {
                HStack {
                    Text("💧 수도 요금")
                    Text("18㎥")
                        .font(.caption)
                    Spacer()
                    Text("\(waterBill)원")
                }
                HStack {
                    Text("⚡️ 전기 요금")
                    Text("93kWh")
                        .font(.caption)
                    Spacer()
                    Text("\(electricityBill)원")
                }
                HStack {
                    Text("🔥 가스 요금")
                    Text("15㎥")
                        .font(.caption)
                    Spacer()
                    Text("\(gasBill)원")
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
        
        HStack {
            Spacer()
            Button(action: {
                print("Hello")
                isShowingPaymentWayView.toggle()
            }, label: {
                Text("납부하기")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            })
            Spacer()
        }
        .listRowBackground(Color.accentColor)
        .sheet(isPresented: $isShowingPaymentWayView) {
            NavigationStack {
                Form {
                    Section {
                        NavigationLink {
                            PaymentView(isShowingPaymentWayView: $isShowingPaymentWayView)
                        } label: {
                            PaymentWayButtonView(imageString: "kakaopay", message: "카카오페이")
                        }
                        NavigationLink {
                            PaymentView(isShowingPaymentWayView: $isShowingPaymentWayView)
                        } label: {
                            PaymentWayButtonView(imageString: "naverpay", message: "네이버페이")
                        }
                        NavigationLink {
                            PaymentView(isShowingPaymentWayView: $isShowingPaymentWayView)
                        } label: {
                            PaymentWayButtonView(imageString: "payco", message: "페이코")
                        }
                        NavigationLink {
                            PaymentView(isShowingPaymentWayView: $isShowingPaymentWayView)
                        } label: {
                            PaymentWayButtonView(imageString: "tosspay", message: "토스페이")
                        }
                        NavigationLink {
                            PaymentView(isShowingPaymentWayView: $isShowingPaymentWayView)
                        } label: {
                            Label("실시간 계좌이체", systemImage: "wonsign.square")
                        }
                        NavigationLink {
                            PaymentView(isShowingPaymentWayView: $isShowingPaymentWayView)
                        } label: {
                            Label("신용/체크카드 납부", systemImage: "creditcard")
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading) {
                            Text("매달 공과금 납부가 귀찮다면?")
                                .font(.subheadline)
                            Text("자동이체 등록으로 간단하게 납부!")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.accent)
//                            Image(systemName: "creditcard")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 40)
//                                .padding(.leading)
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                isShowingChangeAccountSheet.toggle()
                            }, label: {
                                HStack {
                                    Text("등록하러 가기")
                                    Image(systemName: "chevron.right")
                                }
                            })
                            .foregroundStyle(.primary)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .sheet(isPresented: $isShowingChangeAccountSheet, content: {
                        RegisterAccountView(isShowingPaymentWayView: $isShowingPaymentWayView)
                    })
                    
                    Section {
                        HStack {
                            Spacer()
                            Button(role: .cancel, action: {
                                isShowingPaymentWayView.toggle()
                            }, label: {
                                Text("닫기")
                            })
                            Spacer()
                        }
                    }
                }
                .navigationTitle("납부 방법 선택하기")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct YearOnYearView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("전년동월비")
                        .fontWeight(.semibold)
                    Spacer()
                }
                Text("23. 2. 1 ~ 23. 2. 29")
                    .font(.caption)
            }
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    HStack(alignment: .lastTextBaseline) {
                        Text("10.4% 증가")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 1)
                            .foregroundStyle(.accent)
                        Text("했어요")
                            .padding(.leading, -5)
                            .fontWeight(.bold)
                    }
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
                        Text("\(yearOfLastMonth)년 \(lastMonth)월")
                            .fontWeight(.semibold)
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
                        .padding(.top, 1)
                }
            }
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(yearOfTwoMonthsAgo)년 \(TwoMonthsAgo)월")
                            .fontWeight(.semibold)
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
                        .padding(.top, 1)
                }
            }
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(yearOfThreeMonthsAgo)년 \(ThreeMonthsAgo)월")
                            .fontWeight(.semibold)
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
                        .padding(.top, 1)
                }
            }
        }
    }
}
