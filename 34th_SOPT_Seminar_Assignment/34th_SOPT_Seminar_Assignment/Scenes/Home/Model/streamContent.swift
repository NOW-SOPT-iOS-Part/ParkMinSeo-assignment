//
//  streamContent.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import Foundation

/// LIVE 콘텐츠 셀에 사용되는 모델입니다.
struct streamContent {
    /// 컨텐츠 ID
    let contentID: Int
    /// 방송사 이름
    let broadcastingCompany: String
    /// 컨텐츠 이름
    let title: String
    /// 현재 시청률
    let viewerShip: Float
}
