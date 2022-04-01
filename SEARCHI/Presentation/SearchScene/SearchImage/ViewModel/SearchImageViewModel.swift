//
//  SearchImageViewModel.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchImageViewModel: ViewModelType {
    private let searchImageUseCase: SearchImageUseCase
    private let coordinator: SearchCoordinator
    
    init(searchImageUseCase: SearchImageUseCase, coordinator: SearchCoordinator) {
        self.searchImageUseCase = searchImageUseCase
        self.coordinator = coordinator
    }
    
    private let loading = BehaviorRelay<Bool>(value: false)
    private var pageIndex: Int = 1
    private var isAllLoaded = false
    
    func transform(input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let queryRequest = loading.asObservable()
            .sample(input.query.asObservable())
            .flatMap { (loading) -> Observable<Int> in
                if loading {
                    return Observable.empty()
                } else {
                    return Observable<Int>.create { observer in
                        observer.onNext(1)
                        observer.onCompleted()
                        return Disposables.create()
                    }
                }
            }
        
        // scroll 끝
        let nextPageRequest = loading.asObservable()
            .sample(input.loadNextPageTrigger)
            .flatMap { [unowned self] loading -> Observable<Int> in
                if loading {
                    return Observable.empty()
                } else {
                    guard !self.isAllLoaded else { return Observable.empty() }
                    
                    return Observable<Int>.create { [unowned self] observer in
                        self.pageIndex += 1
                        observer.onNext(self.pageIndex)
                        observer.onCompleted()
                        return Disposables.create()
                    }
                }
            }
        
        let page = Observable.merge(queryRequest, nextPageRequest)
//            .debug("page number!")
            .share(replay: 1)
        
        let request = Observable.combineLatest(page, input.query.asObservable())
//            .debug("request!")
        
        let errorTracker = ErrorTracker()
        
        let response = request.flatMapLatest { [unowned self] (page, query)
            -> Observable<[ImageResultListItemViewModel]> in
            self.pageIndex = page
            return self.searchImageUseCase
                 .execute(query: ImageQuery(query: query), page: page)
//                 .trackActivity(activityIndicator)
                 .trackError(errorTracker)
                 .catchAndReturn(ImageDocuments(
                    documents: [],
                    meta: Meta(isEnd: true, pageableCount: 0, totalCount: 0)))
                 .map { $0.documents.map {ImageResultListItemViewModel(with: $0)} }
        }
        
       Observable.combineLatest(request, response, output.imageResultList.asObservable()) {
            [weak self] _, response, imageList in
                if response.isEmpty {
                    output.isEmptyResult.accept(true)
                } else {
                    output.isEmptyResult.accept(false)
                }
                self?.isAllLoaded = response.count < 30
                return self?.pageIndex == 1 ? response : imageList + response
       }
       .sample(response)
       .bind(to: output.imageResultList)
       .disposed(by: disposeBag)
        
        Observable
            .merge(request.map { _ in true },
                   response.map { _ in false })
            .bind(to: loading)
            .disposed(by: disposeBag)
        
        // image cell
        input.didSelectImageCell
            .drive(onNext: { [weak self] viewModel in
                self?.coordinator.showImageDetail(imageDocument: viewModel.imageDocument)
            })
            .disposed(by: disposeBag)
        
        return output
    }
}

extension SearchImageViewModel {
    struct Input {
        let query: Driver<String>
        let loadNextPageTrigger: PublishSubject<Void> = PublishSubject<Void>()
        let didSelectImageCell: Driver<ImageResultListItemViewModel>
    }
    
    struct Output {
        let imageResultList = BehaviorSubject<[ImageResultListItemViewModel]>(value: [])
        let isEmptyResult = BehaviorRelay<Bool>(value: true)
    }
}
