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
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SearchViewController()
        //  vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

}
