//
//  ImagesResponseDTO.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import Foundation

// MARK: - Response
struct ImagesResponseDTO: Codable {
    let documents: [ImageDocumentDTO]
    let meta: MetaDTO
}

extension ImagesResponseDTO {
    // MARK: - Document
    struct ImageDocumentDTO: Codable {
        let datetime: String
        let displaySitename: String
        let imageURL: String
        let thumbnailURL: String
        let width: Int
        let height: Int

        enum CodingKeys: String, CodingKey {
            case datetime
            case displaySitename = "display_sitename"
            case imageURL = "image_url"
            case thumbnailURL = "thumbnail_url"
            case width, height
        }
    }
    
    // MARK: - Meta
    struct MetaDTO: Codable {
        let isEnd: Bool
        let pageableCount, totalCount: Int

        enum CodingKeys: String, CodingKey {
            case isEnd = "is_end"
            case pageableCount = "pageable_count"
            case totalCount = "total_count"
        }
    }
}

extension ImagesResponseDTO {
    func toDomain() -> ImageDocuments {
        return .init(documents: documents.map { $0.toDomain() },
                     meta: meta.toDomain())
    }
}

extension ImagesResponseDTO.ImageDocumentDTO {
    func toDomain() -> ImageDocument {
        return .init(datetime: datetime,
                     displaySitename: displaySitename,
                     imageURL: imageURL,
                     thumbnailURL: thumbnailURL,
                     width: width, height: height)

    }
}

extension ImagesResponseDTO.MetaDTO {
    func toDomain() -> Meta {
        return .init(isEnd: isEnd,
                     pageableCount: pageableCount,
                     totalCount: totalCount)

    }
}

// MARK: - Private
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "ko_kr")
    return formatter
}()


