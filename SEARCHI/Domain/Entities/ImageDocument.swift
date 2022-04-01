//
//  ImageDocument.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import Foundation

// MARK: - Response
struct ImageDocuments: Codable {
    let documents: [ImageDocument]
    let meta: Meta
}

// MARK: - Document
struct ImageDocument: Codable {
    let datetime: String
    let displaySitename: String
    let imageURL: String
    let thumbnailURL: String
    let width: Int
    let height: Int
}

// MARK: - Meta
struct Meta: Codable {
    let isEnd: Bool
    let pageableCount, totalCount: Int
}
