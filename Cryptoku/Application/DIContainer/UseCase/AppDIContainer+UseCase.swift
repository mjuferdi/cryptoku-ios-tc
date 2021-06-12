//
//  AppDIContainer+UseCase.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import Foundation

extension AppDIContainer: UseCaseFactory {
    
    func makeFetchNewsFeedByCategoriesUseCase() -> FetchNewsFeedByCategoriesUseCase {
        return DefaultFetchNewsFeedByCategoriesUseCase(repository: self.makeNewsFeedRepository())
    }
    
    func makeFetchTopListCryptoCurrencyUseCase() -> FetchTopListCryptoCurrencyUseCase {
        return DefaultFetchTopListCryptoCurrencyUseCase(repository: self.makeToplistTopTierRepository())
    }
}
