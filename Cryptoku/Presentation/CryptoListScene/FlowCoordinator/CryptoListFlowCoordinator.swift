//
//  CryptoListFlowCoordinator.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//  Copyright (c) 2021 All rights reserved.
//

import Foundation
import UIKit

// MARK: CryptoListFlowCoordinatorFactory
protocol CryptoListFlowCoordinatorFactory  {
    func makeCPTopListViewController(requestValue: CPTopListViewModelRequestValue,
                                     route: CPTopListViewModelRoute) -> UIViewController
}

// MARK: CryptoListFlowCoordinator
protocol CryptoListFlowCoordinator {
    func start(with instructor: CryptoListFlowCoordinatorInstructor)
}

// MARK: CryptoListFlowCoordinatorInstructor
enum CryptoListFlowCoordinatorInstructor {
    case pushToTopListUI(requestValue: CPTopListViewModelRequestValue)
}

// MARK: DefaultCryptoListFlowCoordinator
final class DefaultCryptoListFlowCoordinator {

    // MARK: DI Variable
    let navigationController: UINavigationController
    let flowCoordinatorFactory: FlowCoordinatorFactory
    let viewControllerFactory: CryptoListFlowCoordinatorFactory

    // MARK: Init Funciton
    init(navigationController: UINavigationController, factory: PresentationFactory) {
        self.navigationController = navigationController
        self.flowCoordinatorFactory = factory
        self.viewControllerFactory = factory
    }
    
}

extension DefaultCryptoListFlowCoordinator: CryptoListFlowCoordinator {
    
    func start(with instructor: CryptoListFlowCoordinatorInstructor) {
        switch instructor {
        case .pushToTopListUI(let requestValue):
            self.showCPTopListUI(requestValue: requestValue)
        }
    }
    
}

extension DefaultCryptoListFlowCoordinator {
    func showCPTopListUI(requestValue: CPTopListViewModelRequestValue) {
        DispatchQueue.main.async {
            let vc = self.initCPTopListUIController(requestValue: requestValue)
            self.navigationController.setViewControllers([vc], animated: true)
        }
    }
}

// MARK: Init View Controller
extension DefaultCryptoListFlowCoordinator {
    public func initCPTopListUIController(requestValue: CPTopListViewModelRequestValue) -> UIViewController
    {
        let route = CPTopListViewModelRoute()
        return self.viewControllerFactory.makeCPTopListViewController(requestValue: requestValue, route: route)
    }
}
