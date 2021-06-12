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

    // MARK: API Network Service
    lazy var cryptoCompareNetworkService: CryptoCompareNetworkService = {
        let service = CryptoCompareNetworkService()
        return service
    }()
    
    // MARK: Storage
    lazy var toplistTopTierStorage: ToplistTopTierStorage = DefaultToplistTopTierStorage(cryptoCompareNetworkService: self.cryptoCompareNetworkService) as! ToplistTopTierStorage
    
    // MARK: Init Function
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}


