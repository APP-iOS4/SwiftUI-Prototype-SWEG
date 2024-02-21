//
//  ChartDummyModel.swift
//  Sweg
//
//  Created by 홍승표 on 2/21/24.
//

import Foundation

struct ChartDummyModel: Identifiable {
    var type: String
    var amount: Int
    var id = UUID()
}

// 세대별 임시 차트 데이터
var chartDummyData: [ChartDummyModel] = [
    ChartDummyModel(type: "\(UtilityType.water.rawValue)", amount: 48621),
    ChartDummyModel(type: "\(UtilityType.electricity.rawValue)", amount: 78010),
    ChartDummyModel(type: "\(UtilityType.gas.rawValue)", amount: 59526)
]


