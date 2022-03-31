//
//  DefaultImageRepository.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import RxSwift
import Moya
import RxMoya

final class DefaultImageRepository: ImageRepository {
    private let provider: MoyaProvider<KakaoAPI>
    
    init() {
        provider = MoyaProvider<KakaoAPI>()
    }
    
    func requestSearchImage(query: ImageQuery, page: Int) -> Single<ImageDocuments> {
        return provider.rx.request(.searchImage)
            .map(ImageDocuments.self)
    }
}
