//
//  mainCVSection.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/30/24.
//

import Foundation

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
