//
//  AppTab.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit

///  AppTabBarController의 탭 내용입니다.
enum AppTab: CaseIterable {
    case home
    case style
    case shop
    case saved
    
    var title: String {
        switch self {
            
        case .home:
            return "홈"
        case .style:
            return "공개예정"
        case .shop:
            return "검색"
        case .saved:
            return "기록"
        }
    }
    
    var image: UIImage {
        switch self {
            
        case .home:
            return .icHome
        case .style:
            return .icWatch
        case .shop:
            return .icSearch
        case .saved:
            return .icHistory
        }
    }
}
