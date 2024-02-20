//
//  MonthlyUtilityModel.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import Foundation


struct MonthlyUtilityModel: Identifiable {
    var id = UUID()
    var year: Int
    var month: Int
    var utility: UtilityModel
    
}





