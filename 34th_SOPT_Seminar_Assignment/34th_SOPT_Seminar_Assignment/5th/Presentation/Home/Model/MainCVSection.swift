//
//  MainCVSection.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import Foundation
import UIKit
import Differentiator

enum MainCVSection: Hashable, CaseIterable {
    /// 최상단 캐러셀 섹션
    case topCarousel
    /// 티빙 추천 콘텐츠 섹션
    case recommend
    /// 라이브 섹션
    case stream
    /// 1화 무료 이벤트 섹션
    case event
    /// 광고 섹션
    case ads
    /// 신비로운 영화 섹션
    case fantastic
}

enum MainCVItem {
    case topCarousel([String])
    case recommend([NormalContent])
    case stream([StreamContent])
    case event([NormalContent])
    case ads([AdContent])
    case fantastic([NormalContent])
}

extension MainCVSection {
    func getHeaderContent() -> HeaderContent {
        switch self {
            
        case .topCarousel:
            return .init(labelTitle: "", showButton: false)
        case .recommend:
            return .init(labelTitle: "티빙에서 꼭 봐야하는 콘텐츠", showButton: true)
        case .stream:
            return .init(labelTitle: "인기 LIVE 채널", showButton: true)
        case .event:
            return .init(labelTitle: "1화 무료! 파라마운트 + 인기 시리즈", showButton: true)
        case .ads:
            return .init(labelTitle: "", showButton: false)
        case .fantastic:
            return .init(labelTitle: "마술보다 더 신비로운 영화(신비로운 영화사전님)", showButton: true)
        }
    }
}
