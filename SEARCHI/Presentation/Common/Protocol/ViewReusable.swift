//
//  ViewReusable.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String {get}
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable {}
