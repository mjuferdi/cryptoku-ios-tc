//
//  AppDIContainer.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import Alamofire
import UIKit

typealias PresentationFactory = FlowCoordinatorFactory & ViewControllerFactory
typealias ViewControllerFactory = CryptoListFlowCoordinatorFactory

final class AppDIContainer {
    let navigationController: UINavigationController

    lazy var session: SessionManager = {
        let session = SessionManager(configuration: self.sessionConfiguration)
        return session
    }()
    lazy var sessionConfiguration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 30
        configuration.timeoutIntervalForRequest = 30
        return configuration
    }()
    
    // MARK: API Network Service
    lazy var cryptoCompareNetworkService: CryptoCompareNetworkService = {
        let service = CryptoCompareNetworkService(session: self.session)
        return service
    }()
    
    // MARK: Storage
    lazy var toplistTopTierStorage: ToplistTopTierStorage = DefaultToplistTopTierStorage(cryptoCompareNetworkService: self.cryptoCompareNetworkService)
    
    // MARK: Init Function
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}


