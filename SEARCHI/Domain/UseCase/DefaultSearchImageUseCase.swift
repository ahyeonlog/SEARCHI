//
//  DefaultSearchImageUseCase.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import RxSwift

final class DefaultSearchImageUseCase: SearchImageUseCase {
    private let imageRepository: ImageRepository
    
    init() {
        imageRepository = DefaultImageRepository()
    }
    
    func execute(query: ImageQuery, page: Int) -> Single<ImageDocuments> {
        return imageRepository.requestSearchImage(query: query, page: page)
    }
}
