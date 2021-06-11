//
//  AppDIContainer.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import UIKit

typealias PresentationFactory = FlowCoordinatorFactory & ViewControllerFactory
typealias ViewControllerFactory = CryptoListFlowCoordinatorFactory

final class AppDIContainer {
    let navigationController: UINavigationController

    
    // MARK: Init Function
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}


