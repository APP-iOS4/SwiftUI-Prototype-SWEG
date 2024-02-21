//
//  MonthlyUtilityStore.swift
//  Sweg
//
//  Created by 김성민 on 2/20/24.
//

import Foundation
import Observation

@Observable
class MonthlyUtilityStore {
    
    var monthlyUtilities: [MonthlyUtilityModel] = []
    
    //순위 작은순부터
    var monthlyTotalSorted: [MonthlyUtilityModel] {
        return monthlyUtilities.sorted { $0.utility.total < $1.utility.total }
    }
    
    // 최대 요금
    var maxUtility: MonthlyUtilityModel? {
        return monthlyTotalSorted.last
    }
    
    // 최소 요금
    var minUtility: MonthlyUtilityModel? {
        return monthlyTotalSorted.first
    }
    
    init() {
        monthlyUtilities = [
            .init(year: 2023, month: 10, utility: UtilityModel(water: 12000, electricity: 8900, gas: 6000)),
            .init(year: 2023, month: 11, utility: UtilityModel(water: 21100, electricity: 11000, gas: 7000)),
            .init(year: 2023, month: 12, utility: UtilityModel(water: 13040, electricity: 21010, gas: 6650)),
            .init(year: 2024, month: 1, utility: UtilityModel(water: 15340, electricity: 9900, gas: 8770)),
            .init(year: 2024, month: 2, utility: UtilityModel(water: 20200, electricity: 11200, gas: 9960)),
        ]
    }
    
    // 사용자 평균치 구할거 (차트용)
    var chartData: [ChartDummyModel] {
            let waterAmount = monthlyUtilities.reduce(0) { $0 + $1.utility.water }
            let electricityAmount = monthlyUtilities.reduce(0) { $0 + $1.utility.electricity }
            let gasAmount = monthlyUtilities.reduce(0) { $0 + $1.utility.gas }
            let totalAmunt = waterAmount + electricityAmount + gasAmount
//        print("월별 수도 요금 평균: \(waterAmount)원")
//        print("월별 전기 요금 평균: \(electricityAmount)원")
//        print("월별 가스 요금 평균: \(gasAmount)원")
        
            return [
                ChartDummyModel(type: "\(UtilityType.water.rawValue)", amount: waterAmount),
                ChartDummyModel(type: "\(UtilityType.electricity.rawValue)", amount: electricityAmount),
                ChartDummyModel(type: "\(UtilityType.gas.rawValue)", amount: gasAmount)
           
            ]
        }
    
    }

    
//    func utilityText(type: UtilityType, monthlyUtility: MonthlyUtilityModel) -> String {
//        switch type {
//        case .water:
//            return "\(type.rawValue) \(monthlyUtility.utility.water)원"
//        case .electricity:
//            return "\(type.rawValue) \(monthlyUtility.utility.electricity)원"
//        case .gas:
//            return "\(type.rawValue) \(monthlyUtility.utility.gas)원"
//        case .total:
//            return "\(type.rawValue) \(monthlyUtility.utility.total)원"
//        }
//    }

