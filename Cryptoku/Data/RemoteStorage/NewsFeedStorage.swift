//
//  NewsFeedStorage.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//

import Alamofire
import Foundation

public protocol NewsFeedStorage {
    func fetchNewsByCategory(parameter: [String: Any], completion: @escaping (Result<NewsDomain>) -> Void)
}

public final class DefaultNewsFeedStorage {
    let cryptoCompareNetworkService: CryptoCompareNetworkService
    public init(cryptoCompareNetworkService: CryptoCompareNetworkService) {
        self.cryptoCompareNetworkService = cryptoCompareNetworkService
    }
}

extension DefaultNewsFeedStorage: NewsFeedStorage {
    public func fetchNewsByCategory(parameter: [String : Any], completion: @escaping (Result<NewsDomain>) -> Void) {
        let errorMessage = CommonString.failedFetchData()
        let error = NSError.create(with: errorMessage)
        
        self.cryptoCompareNetworkService.fetchNewsByCategory(parameters: parameter) { (response) in
            guard let responseValue = response?.result.value else {
                return completion(.failure(error))
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: responseValue, options: .prettyPrinted)
                let newsDomain = try JSONDecoder().decode(NewsDomain.self, from: jsonData)
                completion(.success(newsDomain))
            }
            catch {  completion(.failure(error)) }
        } failure: { (errorResponse) in
            guard let errorValue = errorResponse?.error else {
                return completion(.failure(error))
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: errorValue, options: .prettyPrinted)
                let _: ErrorResponseDomain = try JSONDecoder().decode(ErrorResponseDomain.self, from: jsonData)
                completion(.failure(errorValue))
            }
            catch { completion(.failure(error)) }
        }

        
    }
    
    
}
