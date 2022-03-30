//
//  SecretKey+Bundle+Ex.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/30.
//

import Foundation

extension Bundle {
    var kakaoAK: String {
        guard let file = self.path(forResource: "KakaoService-Info", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["KAKAO_REST_API_KEY"] as? String else { fatalError("KakaoService-Info.plist에 ") }
        return key
    }
}
