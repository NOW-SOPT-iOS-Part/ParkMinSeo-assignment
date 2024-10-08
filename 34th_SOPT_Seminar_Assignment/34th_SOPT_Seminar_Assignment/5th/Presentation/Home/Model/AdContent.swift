//
//  AdContent.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import Foundation

/// 광고 콘텐츠 셀에 사용되는 모델입니다.
struct AdContent {
    /// 컨텐츠 ID
    let contentId: Int
    /// 이미지
    let image: String
}

extension AdContent {
    static func dummyData() -> [AdContent] {
        return [
            AdContent(contentId: 1, image: "longTabImage1"),
            AdContent(contentId: 2, image: "longTabImage1")
        ]
    }
}
