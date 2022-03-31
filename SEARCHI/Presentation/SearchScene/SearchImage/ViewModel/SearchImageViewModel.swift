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
    
    func transform(input: Input, disposeBag: DisposeBag) -> Output {

        let output = Output()
        
        input.query
            .drive(onNext: { text in
                print("text", text)
            })
            .disposed(by: disposeBag)
        
        
        return output
    }
}

extension SearchImageViewModel {
    struct Input {
        let query: Driver<String>
    }
    
    struct Output {
        
    }
}
