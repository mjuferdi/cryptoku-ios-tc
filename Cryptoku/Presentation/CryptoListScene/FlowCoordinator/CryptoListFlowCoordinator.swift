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
    func makeCPNewsController(requestValue: CPNewsViewModelRequestValue,
                              route: CPNewsViewModelRoute) -> UIViewController
    func makeCPTopListViewController(requestValue: CPTopListViewModelRequestValue,
                                     route: CPTopListViewModelRoute) -> UIViewController
}

// MARK: CryptoListFlowCoordinator
protocol CryptoListFlowCoordinator {
    func start(with instructor: CryptoListFlowCoordinatorInstructor)
}

// MARK: CryptoListFlowCoordinatorInstructor
enum CryptoListFlowCoordinatorInstructor {
    case presentNewsUI(requestValue: CPNewsViewModelRequestValue)
    case pushToTopListUI(requestValue: CPTopListViewModelRequestValue)
}

// MARK: DefaultCryptoListFlowCoordinator
final class DefaultCryptoListFlowCoordinator {

    // MARK: DI Variable
    let navigationController: UINavigationController
    let flowCoordinatorFactory: FlowCoordinatorFactory
    let viewControllerFactory: CryptoListFlowCoordinatorFactory

    var cpNewsController: CPNewsController?
    
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
        case .presentNewsUI(let requestValue):
            self.showCPNewsUI(requestValue: requestValue)
        case .pushToTopListUI(let requestValue):
            self.showCPTopListUI(requestValue: requestValue)
        }
    }
    
}

extension DefaultCryptoListFlowCoordinator {
    
    func showCPNewsUI(requestValue: CPNewsViewModelRequestValue) {
        DispatchQueue.main.async {
            let vc = self.initCPNewstUIController(requestValue: requestValue)
            self.navigationController.present(vc, animated: true, completion: nil)
        }
    }
    
    func showCPTopListUI(requestValue: CPTopListViewModelRequestValue) {
        DispatchQueue.main.async {
            let vc = self.initCPTopListUIController(requestValue: requestValue)
            self.navigationController.setViewControllers([vc], animated: true)
        }
    }
}

// MARK: Init View Controller
extension DefaultCryptoListFlowCoordinator {
    
    public func initCPNewstUIController(requestValue: CPNewsViewModelRequestValue) -> UIViewController {
        
        let dismiss = {
            DispatchQueue.main.async {
                let root = UIApplication.shared.keyWindow?.rootViewController
                root?.dismiss(animated: true, completion: nil)
            }
        }
        
        let route = CPNewsViewModelRoute(dismiss: dismiss)
        return self.viewControllerFactory.makeCPNewsController(requestValue: requestValue, route: route)
    }
    
    public func initCPTopListUIController(requestValue: CPTopListViewModelRequestValue) -> UIViewController
    {
        let route = CPTopListViewModelRoute(startCryptoListFlow: self.start(with:))
        return self.viewControllerFactory.makeCPTopListViewController(requestValue: requestValue, route: route)
    }
}
