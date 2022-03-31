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
    }
    
    func bindViewModel() {
        let input = SearchImageViewModel.Input(
            query: mainView.searchBar.rx
                .text
                .orEmpty
                .changed
                .asDriver()
        )
        
        let output = viewModel?.transform(input: input, disposeBag: disposeBag)
    }
}
