//
//  NetworkService.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import Foundation
import Moya
import RxMoya
import RxSwift

enum KakaoAPI {
    case searchImage(param: ImageRequestDTO)
}


extension KakaoAPI: TargetType {
    var baseURL: URL {
        return URL(string: "\(Endpoint.baseURL)")!
    }
    
    var path: String {
        switch self {
        case .searchImage:
            return "v2/search/image"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchImage:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .searchImage(let param):
            return .requestParameters(
                parameters: param.toDictionary,
                encoding: URLEncoding.default)
        }
        
    }
    
    var headers: [String : String]? {
        return [
            "Authorization": "KakaoAK \(Bundle.main.kakaoAK)"
        ]
    }
}
