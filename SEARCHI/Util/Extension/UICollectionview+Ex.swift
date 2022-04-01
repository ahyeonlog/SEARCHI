//
//  UICollectionview+Ex.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import UIKit

extension UICollectionView {
    func setEmptyCollectionView(message: String = "검색 결과가 없습니다") {
        let label = UILabel()
        label.text = message
        label.textColor = .label
        label.textAlignment = .center
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        backgroundView.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.backgroundView = backgroundView
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
