//
//  FetchTopListCryptoCurrencyUseCase.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//  Copyright (c) 2021 All rights reserved.

import Foundation

public enum FetchTopListCryptoCurrencyUseCaseError: LocalizedError {
    
}

extension FetchTopListCryptoCurrencyUseCaseError {
    
    public var errorDescription: String? {
        switch self {
        }
    }
    
}

public struct FetchTopListCryptoCurrencyUseCaseResponse {
    public let topList: ToplistTopTierDomain
}

public struct FetchTopListCryptoCurrencyUseCaseRequest {
    let parameter: [String: Any]
}

public protocol FetchTopListCryptoCurrencyUseCase {
    
    func execute(_ request: FetchTopListCryptoCurrencyUseCaseRequest,
                 completion: @escaping (Result<FetchTopListCryptoCurrencyUseCaseResponse, Error>) -> Void)

}

public final class DefaultFetchTopListCryptoCurrencyUseCase {

    let repository: ToplistTopTierRepository
    public init(repository: ToplistTopTierRepository) {
        self.repository = repository
    }

}

extension DefaultFetchTopListCryptoCurrencyUseCase: FetchTopListCryptoCurrencyUseCase {

    public func execute(_ request: FetchTopListCryptoCurrencyUseCaseRequest,
                        completion: @escaping (Result<FetchTopListCryptoCurrencyUseCaseResponse, Error>) -> Void) {
        self.repository.getToplistTopTier(parameter: request.parameter) { (result) in
            switch result {
            case .success(let response):
                let result = FetchTopListCryptoCurrencyUseCaseResponse(topList: response)
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
}
