//
//  AppDIContainer+UseCase.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import Foundation

extension AppDIContainer: UseCaseFactory {
    func makeFetchTopListCryptoCurrencyUseCase() -> FetchTopListCryptoCurrencyUseCase {
        return DefaultFetchTopListCryptoCurrencyUseCase(repository: self.makeToplistTopTierRepository())
    }
}
