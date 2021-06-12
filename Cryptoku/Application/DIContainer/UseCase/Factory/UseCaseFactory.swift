//
//  UseCaseFactory.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import Foundation

public protocol UseCaseFactory {
    func makeFetchNewsFeedByCategoriesUseCase() -> FetchNewsFeedByCategoriesUseCase
    func makeFetchTopListCryptoCurrencyUseCase() -> FetchTopListCryptoCurrencyUseCase
}
