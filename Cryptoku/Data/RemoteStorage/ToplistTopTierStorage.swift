//
//  ToplistTopTierStorage.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Alamofire
import Foundation


public protocol ToplistTopTierStorage {
    func fetchToplistTopTier(parameter: [String: Any], completion: @escaping (Result<ToplistTopTierDomain>) -> Void)
}

public final class DefaultToplistTopTierStorage {
    let cryptoCompareNetworkService: CryptoCompareNetworkService
    
    public init(cryptoCompareNetworkService: CryptoCompareNetworkService) {
        self.cryptoCompareNetworkService = cryptoCompareNetworkService
    }
    
}

extension DefaultToplistTopTierStorage: ToplistTopTierStorage {
    
    public func fetchToplistTopTier(parameter: [String : Any], completion: @escaping (Result<ToplistTopTierDomain>) -> Void) {
        
        let errorMessage = CommonString.failedFetchData()
        let error = NSError.create(with: errorMessage)
 
        self.cryptoCompareNetworkService.fetchToplistTopTier(parameters: parameter) { (response) in
            guard let responseValue = response?.result.value else {
                return completion(.failure(error))
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: responseValue, options: .prettyPrinted)
                let toplistTopTierDomain = try JSONDecoder().decode(ToplistTopTierDomain.self, from: jsonData)
                completion(.success(toplistTopTierDomain))
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


