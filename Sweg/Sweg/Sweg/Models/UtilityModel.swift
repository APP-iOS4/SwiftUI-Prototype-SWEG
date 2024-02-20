//
//  UtilityModel.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import Foundation

struct UtilityModel {

    var water: Int
    var electricity: Int
    var gas: Int
    
    var total: Int {
        return water + electricity + gas
    }
}



