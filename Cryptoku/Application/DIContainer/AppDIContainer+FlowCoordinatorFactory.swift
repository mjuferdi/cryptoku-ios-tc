//
//  AppDIContainer+FlowCoordinatorFactory.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import Foundation

extension AppDIContainer: FlowCoordinatorFactory {
    
    // MARK: Crypto List Flow
    func instantiateCryptoListFlowCoordinator() -> CryptoListFlowCoordinator {
        return DefaultCryptoListFlowCoordinator(navigationController: self.navigationController, factory: self)
    }

}
