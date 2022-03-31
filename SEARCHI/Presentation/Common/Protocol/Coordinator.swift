//
//  Coordinator.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/31.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var type: CoordinatorType { get }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
    init(_ navigationController: UINavigationController)
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}

enum CoordinatorType {
    case search
}
