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
        var output = Output(
            datetime: imageDocument.datetime,
            displaySitename: imageDocument.displaySitename,
            imageURL: imageDocument.imageURL)

//        print("date", imageDocument.datetime)
//        if let date = imageDocument.datetime {
//            output.datetime = "\(dateFormatter.string(from: date))"
//        }
        return output
    }
    
}

extension DetailImageViewModel {
    struct Input {}
    struct Output {
        var datetime: String
        let displaySitename: String
        let imageURL: String
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
