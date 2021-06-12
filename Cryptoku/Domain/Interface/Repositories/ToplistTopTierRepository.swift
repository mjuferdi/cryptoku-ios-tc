//
//  ToplistTopTierRepository.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Foundation

public protocol ToplistTopTierRepository {
    func getToplistTopTier(parameter: [String: Any], completion: @escaping (Result<ToplistTopTierDomain, Error>) -> Void)
}
