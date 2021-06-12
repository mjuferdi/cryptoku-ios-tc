//
//  FetchNewsFeedByCategoriesUseCase.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//  Copyright (c) 2021 All rights reserved.

import Foundation

public enum FetchNewsFeedByCategoriesUseCaseError: LocalizedError {
    
}

extension FetchNewsFeedByCategoriesUseCaseError {
    
    public var errorDescription: String? {
        switch self {
        }
    }
    
}

public struct FetchNewsFeedByCategoriesUseCaseResponse {
    public let newsFeed: NewsDomain
}

public struct FetchNewsFeedByCategoriesUseCaseRequest {
    let parameter: [String: Any]
}

public protocol FetchNewsFeedByCategoriesUseCase {
    
    func execute(_ request: FetchNewsFeedByCategoriesUseCaseRequest,
                 completion: @escaping (Result<FetchNewsFeedByCategoriesUseCaseResponse, Error>) -> Void)

}

public final class DefaultFetchNewsFeedByCategoriesUseCase {

    let repository: NewsFeedRepository
    public init(repository: NewsFeedRepository) {
        self.repository = repository
    }

}

extension DefaultFetchNewsFeedByCategoriesUseCase: FetchNewsFeedByCategoriesUseCase {

    public func execute(_ request: FetchNewsFeedByCategoriesUseCaseRequest,
                        completion: @escaping (Result<FetchNewsFeedByCategoriesUseCaseResponse, Error>) -> Void) {
        self.repository.getNewsFeed(parameter: request.parameter) { (result) in
            switch result {
            case .success(let response):
                let result = FetchNewsFeedByCategoriesUseCaseResponse(newsFeed: response)
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
