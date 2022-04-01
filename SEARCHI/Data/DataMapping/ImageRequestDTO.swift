//
//  ImageRequestDTO.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import Foundation

struct ImageRequestDTO {
    var toDictionary: [String: Any] {
        let dict: [String: Any] = [
            "query": query,
            "page": page,
            "size": size
        ]
        return dict
    }
    
    let query: String
    let page: Int
    let size: Int = 30
}
