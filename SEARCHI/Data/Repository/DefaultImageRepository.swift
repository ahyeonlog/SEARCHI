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
        let requestDTO = ImageRequestDTO(query: query.query, page: page)
        return provider.rx.request(.searchImage(param: requestDTO))
            .map(ImagesResponseDTO.self)
            .map { $0.toDomain() }
            .do(onSuccess: { (response) in
                print("response \(response.meta.totalCount)")
            })
    }
}
