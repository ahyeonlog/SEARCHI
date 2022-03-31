//
//  SearchImageUseCase.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import RxSwift

protocol SearchImageUseCase {
    func execute(query: ImageQuery, page: Int) -> Single<ImageDocuments>
}
