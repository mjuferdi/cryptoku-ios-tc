//
//  FlowCoordinatorFactory.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import Foundation

protocol FlowCoordinatorFactory {
    func instantiateCryptoListFlowCoordinator() -> CryptoListFlowCoordinator
}
