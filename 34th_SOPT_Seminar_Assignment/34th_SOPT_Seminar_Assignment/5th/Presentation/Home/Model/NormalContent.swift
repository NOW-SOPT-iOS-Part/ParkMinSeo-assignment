//
//  NormalContent.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import Foundation

/// 일반 콘텐츠 셀에 사용되는 모델입니다.
struct NormalContent {
    /// 컨텐츠 ID
    let contentId: Int
    /// 이미지
    let image: String
    /// 컨텐츠 타이틀
    let title: String
}

extension NormalContent {
    static func dummyData() -> [NormalContent] {
        return [
            NormalContent(contentId: 1, image: "contentImage1", title: "시그널"),
            NormalContent(contentId: 2, image: "contentImage2", title: "해리포터와 마법사의 돌"),
            NormalContent(contentId: 3, image: "contentImage3", title: "반지의 제왕"),
            NormalContent(contentId: 4, image: "contentImage4", title: "스즈메의 문단속"),
        ]
    }
}
