//
//  StreamContent.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import Foundation

/// LIVE 콘텐츠 셀에 사용되는 모델입니다.
struct StreamContent {
    /// 컨텐츠 ID
    let contentID: Int
    /// 이미지
    let image: String
    /// 현재 순위
    let rank: Int
    /// 방송사 이름
    let broadcastingCompany: String
    /// 컨텐츠 이름
    let title: String
    /// 현재 시청률
    let viewerShip: Float
}

extension StreamContent {
    static func dummyData() -> [StreamContent] {
        return [
            StreamContent(contentID: 1, image: "contentImage1", rank: 1, broadcastingCompany: "Mnet", title: "보이즈 플래닛 12화", viewerShip: 80.0),
            StreamContent(contentID: 2, image: "contentImage2", rank: 2, broadcastingCompany: "Mnet", title: "하트 시그널 4화", viewerShip: 24.1),
            StreamContent(contentID: 3, image: "contentImage3", rank: 3, broadcastingCompany: "Mnet", title: "슈퍼스타K", viewerShip: -4.1),
            StreamContent(contentID: 4, image: "contentImage4", rank: 4, broadcastingCompany: "Mnet", title: "모름", viewerShip: 0.0)
        ]
    }
}
