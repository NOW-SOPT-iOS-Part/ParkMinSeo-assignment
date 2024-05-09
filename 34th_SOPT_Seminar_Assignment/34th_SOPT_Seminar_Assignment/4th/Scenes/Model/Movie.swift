//
//  Movie.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 5/10/24.
//

import Foundation

struct Movie {
    /// 영화명(국문)
    let name: String
    /// 영화문(영문)
    let nameEng: String
    /// 제작연도
    let prdtYear: String
    /// 개봉일
    let openDate: String
    /// 영화 유형
    let movieType: String
    /// 영화 장르
    let genre: String
    /// 제작진
    let directors: [String]
}
