//
//  RepositoryFactory.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Foundation

public protocol RepositoryFactory {
    func makeNewsFeedRepository() -> NewsFeedRepository
    func makeToplistTopTierRepository() -> ToplistTopTierRepository
}
