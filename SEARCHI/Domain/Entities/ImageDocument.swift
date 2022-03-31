//
//  ImageDocument.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import Foundation

// MARK: - Request
struct ImageDocuments: Codable {
    let documents: [ImageDocument]
    let meta: Meta
}

// MARK: - Document
struct ImageDocument: Codable {
    let collection: Collection
    let datetime: String
    let displaySitename: DisplaySitename
    let docURL: String
    let height: Int
    let imageURL: String
    let thumbnailURL: String
    let width: Int

    enum CodingKeys: String, CodingKey {
        case collection, datetime
        case displaySitename = "display_sitename"
        case docURL = "doc_url"
        case height
        case imageURL = "image_url"
        case thumbnailURL = "thumbnail_url"
        case width
    }
}

enum Collection: String, Codable {
    case blog = "blog"
    case cafe = "cafe"
    case etc = "etc"
    case news = "news"
}

enum DisplaySitename: String, Codable {
    case daum블로그 = "Daum블로그"
    case daum카페 = "Daum카페"
    case 국민일보 = "국민일보"
    case 네이버블로그 = "네이버블로그"
    case 티스토리 = "티스토리"
    case 펫노트 = "펫노트"
    case 하이닥 = "하이닥"
    case empty = ""
}

// MARK: - Meta
struct Meta: Codable {
    let isEnd: Bool
    let pageableCount, totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
