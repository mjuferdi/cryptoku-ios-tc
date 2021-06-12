//
//  NewsFeedRepository.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//

import Foundation

public protocol NewsFeedRepository {
    func getNewsFeed(parameter: [String: Any], completion: @escaping (Result<NewsDomain, Error>) -> Void)
}
