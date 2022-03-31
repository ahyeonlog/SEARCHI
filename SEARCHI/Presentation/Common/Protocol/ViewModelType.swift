//
//  ViewModelType.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input, disposeBag: DisposeBag) -> Output
}
