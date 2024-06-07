//
//  Movies.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/7/24.
//

import UIKit

// API와 응답할 때 사용할 객체
// API의 필드와 프로퍼티 이름이 같아야 함
// 개별 영화의 정보
struct BoxOfficeResult:Decodable {
    
    let rank: String
    let movieNm: String
    let movieCd: String

}
// 통신한 API의 데이터를 담는 역할
// dailyBoxOfficeList가 api에서 배열로 되어 있음
struct DailyBoxOfficeData:Decodable {
    static var showRange  = "20240606"
    let dailyBoxOfficeList: [BoxOfficeResult]
    
}

// 사용하기 편리하게 만들기 위해
struct BoxOfficeData: Decodable {
    let boxOfficeResult: DailyBoxOfficeData
}


