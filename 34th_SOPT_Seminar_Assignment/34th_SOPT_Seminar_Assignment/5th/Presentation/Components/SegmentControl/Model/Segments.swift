//
//  Segments.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import Foundation

enum Segments: String, Hashable, CaseIterable {
    case home
    case live
    case tv
    case movie
    case paramount
    
    var title: String {
        switch self {
            
        case .home:
            return "홈"
        case .live:
            return "실시간"
        case .tv:
            return "TV프로그램"
        case .movie:
            return "영화"
        case .paramount:
            return "파라마운트+"
        }
    }
}
