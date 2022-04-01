//
//  DefaultSearchCoordinator.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import UIKit

final class DefaultSearchCoordinator: NSObject, SearchCoordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var finishDelegate: CoordinatorFinishDelegate?
    var type: CoordinatorType = .search
    var searchImageViewController: SearchImageViewController
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.searchImageViewController = SearchImageViewController()
    }
    
    func start() {
        searchImageViewController.viewModel = SearchImageViewModel(
            searchImageUseCase: DefaultSearchImageUseCase(),
            coordinator: self
        )
        navigationController.pushViewController(searchImageViewController, animated: false)
    }
    
    func showImageDetail() {
        let detailImageViewController = DetailImageViewController()
        navigationController.pushViewController(detailImageViewController, animated: true)
    }
}
