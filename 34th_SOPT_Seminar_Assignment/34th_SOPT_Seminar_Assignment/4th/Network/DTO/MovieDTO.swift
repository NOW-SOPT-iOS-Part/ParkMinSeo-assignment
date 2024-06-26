//
//  MovieDTO.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 5/10/24.
//

import Foundation

// MARK: GetMoviesDTO
struct GetMoviesDTO: Decodable {
    let movieListResult: MovieListResult
}

struct MovieListResult: Decodable {
    let totCnt: Int
    let source: String
    let movieList: [MovieList]
}

struct MovieList: Decodable {
    let movieCd, movieNm, movieNmEn, prdtYear: String
    let openDt: String
    let typeNm: String
    let prdtStatNm, nationAlt, genreAlt, repNationNm: String
    let repGenreNm: String
    let directors: [Director]
    let companys: [Company]
}

struct Company: Decodable {
    let companyCd, companyNm: String
}

struct Director: Decodable {
    let peopleNm: String
}

extension GetMoviesDTO {
    func toMovieList() -> [Movie] {
        return self.movieListResult.movieList.map {
            return Movie(
                name: $0.movieNm,
                nameEng: $0.movieNmEn,
                prdtYear: $0.prdtYear,
                openDate: $0.openDt,
                movieType: $0.typeNm,
                genre: $0.genreAlt,
                directors: $0.directors.map { $0.peopleNm }
            )
        }
    }
}


// MARK: GetDailyBoxOfficeDTO
struct GetDailyBoxOfficeDTO: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Decodable {
    let rnum, rank, rankInten: String
    let rankOldAndNew: String
    let movieCd, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String
}
