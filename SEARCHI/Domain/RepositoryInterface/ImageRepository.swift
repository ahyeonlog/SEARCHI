//
//  ImageRepository.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import RxSwift

protocol ImageRepository: AnyObject {
    func requestSearchImage(query: ImageQuery, page: Int) -> Single<ImageDocuments> // 이미지 검색 결과
}

