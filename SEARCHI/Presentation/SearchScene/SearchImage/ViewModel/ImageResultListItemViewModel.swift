//
//  ImageResultListItemViewModel.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import Foundation

struct ImageResultListItemViewModel {
    let thumbnailURL: String
}

extension ImageResultListItemViewModel {
    init(with imageDocument: ImageDocument) {
        self.thumbnailURL = imageDocument.thumbnailURL
    }
}
