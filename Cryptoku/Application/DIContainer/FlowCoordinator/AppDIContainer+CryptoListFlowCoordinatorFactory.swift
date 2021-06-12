//
//  AppDIContainer+CryptoListFlowCoordinatorFactory.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import UIKit

extension AppDIContainer: CryptoListFlowCoordinatorFactory {
    func makeCPTopListViewController(requestValue: CPTopListViewModelRequestValue, route: CPTopListViewModelRoute) -> UIViewController {
        return CPTopListController.create(with: self.makeCPTopListViewModel(requestValue: requestValue, route: route))
    }
    
    private func makeCPTopListViewModel(requestValue: CPTopListViewModelRequestValue, route: CPTopListViewModelRoute) -> CPTopListViewModel {
        return DefaultCPTopListViewModel(
            requestValue: requestValue,
            route: route,
            fetchTopListCryptoCurrencyUseCase: self.makeFetchTopListCryptoCurrencyUseCase())
    }
    
}
