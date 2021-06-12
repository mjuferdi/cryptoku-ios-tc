//
//  DefaultToplistTopTierRepository.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Foundation

public class DefaultToplistTopTierRepository {
    let toplistTopTierStorage: ToplistTopTierStorage

    public init(toplistTopTierStorage: ToplistTopTierStorage) {
        self.toplistTopTierStorage = toplistTopTierStorage
    }
    
}

extension DefaultToplistTopTierRepository: ToplistTopTierRepository {
    
    public func getToplistTopTier(parameter: [String : Any], completion: @escaping (Result<ToplistTopTierDomain, Error>) -> Void) {
        return self.toplistTopTierStorage.fetchToplistTopTier(parameter: parameter) { (result) in
            switch result {
            case .success(let respose):
                completion(.success(respose))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
