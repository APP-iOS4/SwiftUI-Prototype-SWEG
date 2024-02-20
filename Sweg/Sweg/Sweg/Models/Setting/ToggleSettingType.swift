//
//  ToggleSettingType.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import Foundation

enum ToggleSettingType: String, CustomStringConvertible {
    case paidNotification = "공과금 납부 알림"
    case newPostNotification = "게시판 새 글 알림"
    case serviceNotification = "서비스 혜택 알림"
    case autoPaySetting = "자동이체 설정"
    case useAppLock = "앱 잠금 사용"
    case useFaceId = "FaceID 사용"
    
    var description: String {
        switch self {
        case .paidNotification:
            return "paidNotification"
        case .newPostNotification:
            return "newPostNotification"
        case .serviceNotification:
            return "serviceNotification"
        case .autoPaySetting:
            return "autiPaySetting"
        case .useAppLock:
            return "useAppLock"
        case .useFaceId:
            return "userFaceId"
        }
    }
}

