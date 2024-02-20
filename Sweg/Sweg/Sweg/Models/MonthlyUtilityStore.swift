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
    
    init() {
        monthlyUtilities = [
            .init(year: 2023, month: 10, utility: UtilityModel(water: 12000, electricity: 8900, gas: 6000)),
            .init(year: 2023, month: 11, utility: UtilityModel(water: 21100, electricity: 11000, gas: 7000)),
            .init(year: 2023, month: 12, utility: UtilityModel(water: 13040, electricity: 21010, gas: 6650)),
            .init(year: 2024, month: 1, utility: UtilityModel(water: 15340, electricity: 9900, gas: 8770)),
            .init(year: 2024, month: 2, utility: UtilityModel(water: 20200, electricity: 11200, gas: 9960)),
        ]
    }
}
