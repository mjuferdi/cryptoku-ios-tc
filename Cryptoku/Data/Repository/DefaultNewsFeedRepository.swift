//
//  DefaultNewsFeedRepository.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//

import Foundation

public class DefaultNewsFeedRepository {
    let newsFeedStorage: NewsFeedStorage
    public init( newsFeedStorage: NewsFeedStorage) {
        self.newsFeedStorage = newsFeedStorage
    }
    
}

extension DefaultNewsFeedRepository: NewsFeedRepository {
    public func getNewsFeed(parameter: [String : Any], completion: @escaping (Result<NewsDomain, Error>) -> Void) {
        return self.newsFeedStorage.fetchNewsByCategory(parameter: parameter) { (result) in
            switch result {
            case .success(let respose):
                completion(.success(respose))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
