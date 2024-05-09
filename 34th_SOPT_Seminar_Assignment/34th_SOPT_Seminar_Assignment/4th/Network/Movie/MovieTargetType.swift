//
//  MovieTargetType.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 5/10/24.
//

import Foundation
import Moya

enum MovieTargetType {
    case getMovies(movieName: String)
    case getDailyBoxOffice(date: String)
}

extension MovieTargetType: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://www.kobis.or.kr/kobisopenapi/webservice/rest")!
    }
    
    var path: String {
        switch self {
            
        case .getMovies:
            return "/movie/searchMovieList.json"
        case .getDailyBoxOffice:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getMovies, .getDailyBoxOffice:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .getMovies(let movieName):
            let params = [
                "key" : "Asfd",
                "movieNm" : movieName
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .getDailyBoxOffice(let date):
            let params = [
                "key" : "Asfd",
                "targetDt" : date
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
