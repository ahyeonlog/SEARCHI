//
//  DetailImageViewModel.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import Foundation

final class DetailImageViewModel: ViewModelType {
    private let imageDocument: ImageDocument
    
    init(imageDocument: ImageDocument) {
        self.imageDocument = imageDocument
    }
    func transform(input: Input) -> Output {
        let output = Output(
            datetime: imageDocument.datetime,
            displaySitename: imageDocument.displaySitename,
            imageURL: imageDocument.imageURL)
        return output
    }
    
}

extension DetailImageViewModel {
    struct Input {}
    struct Output {
        let datetime: String
        let displaySitename: String
        let imageURL: String
    }
}
