//
//  SearchView.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import UIKit
import SnapKit
import Then

final class SearchView: UIView, ViewRepresentable {
    let searchBar = UISearchBar().then {
        $0.placeholder = "어떤 이미지를 찾고 있나요?"
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let spacing: CGFloat = 8
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(collectionView)
    }
    
    func setUpConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
