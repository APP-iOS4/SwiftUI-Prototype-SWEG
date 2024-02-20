//
//  BoardModel.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import Foundation

struct BoardModel: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var date: Date
    var hits: Int
    
    var dateString: String {
        let formatter = DateFormatter()
//        코드 구현... 해주세요 화이팅!
        return "화이팅"
    }
}
