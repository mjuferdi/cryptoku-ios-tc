//
//  AppDIContainer+Repository.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Foundation

extension AppDIContainer: RepositoryFactory {
    
    func makeNewsFeedRepository() -> NewsFeedRepository {
        return DefaultNewsFeedRepository(newsFeedStorage: self.newsFeedStorage)
    }
    
    func makeToplistTopTierRepository() -> ToplistTopTierRepository {
        return DefaultToplistTopTierRepository(toplistTopTierStorage: self.toplistTopTierStorage)
    }
}
