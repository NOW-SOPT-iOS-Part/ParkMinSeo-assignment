//
//  mainCVSection.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/30/24.
//

import Foundation

enum MainCVSection: Hashable, CaseIterable {
    case recommend // 티빙 추천 콘텐츠 섹션
    case stream // 라이브 섹션
    case event // 1화 무료 이벤트 섹션
    case ads // 광고 섹션
    case fantastic // 신비로운 영화 섹션
}
