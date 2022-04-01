//
//  SearchImageViewController.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/30.
//

import UIKit
import RxSwift

final class SearchImageViewController: UIViewController {
    let mainView = SearchImageView()
    
    var viewModel: SearchImageViewModel?
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        bindViewModel()
    }

}

private extension SearchImageViewController {
    func configureUI() {
        self.navigationItem.titleView = mainView.searchBar
        mainView.collectionView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        let input = SearchImageViewModel.Input(
            query: mainView.searchBar.rx
                .text
                .orEmpty
                .changed
                .asDriver()
                .debounce(.seconds(1))
        )
        
        let output = viewModel?.transform(input: input, disposeBag: disposeBag)
        
        output?.imageResultList
            .asDriver(onErrorJustReturn: [])
            .drive(
                mainView.collectionView.rx.items(
                    cellIdentifier: SearchImageCollectionViewCell.reuseIdentifier,
                    cellType: SearchImageCollectionViewCell.self)
            ) { _, viewModel, cell in
                cell.bind(viewModel)
            }
            .disposed(by: disposeBag)
        
        
        
    }
}

extension SearchImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellWidth = (width - 6) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
