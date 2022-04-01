//
//  SearchImageCollectionViewCell.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import UIKit
import SnapKit

final class SearchImageCollectionViewCell: UICollectionViewCell, ViewRepresentable {
    let searchImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpViews() {
        contentView.addSubview(searchImageView)
    }
    
    func setUpConstraints() {
        searchImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(_ viewModel: ImageResultListItemViewModel) {
        self.searchImageView.setImage(with: viewModel.thumbnailURL)
    }
    
    override func prepareForReuse() {
        self.searchImageView.image = nil
    }
}
