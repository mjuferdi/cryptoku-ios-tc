//
//  CryptoCompareNetworkServiceTests.swift
//  CryptokuTests
//
//  Created by Mario MJ on 13.06.21.
//

import Alamofire
import XCTest
@testable import DEV_Cryptoku

class CryptoCompareNetworkServiceTests: XCTestCase {
    
    private lazy var sut = self.makeCryptoCompareNetworkServiceSUT()
    
    var topList: ToplistTopTierDomain?
    
    func test_fetchToplist_shouldFetchedAtleastFiftyCryptoFromToplistEndpoint() {
        let parameter: [String: Any] = [
            "tsym": "USD",
            "limit": 50
        ]
        self.execute(parameter: parameter)
        guard let result = topList else { return }
        XCTAssertTrue(result.data!.isEmpty)
        XCTAssertTrue(result.data!.count > 20)
        
    }
    
    func execute(parameter: [String: Any]) {
        self.sut.networkService.fetchToplistTopTier(parameters: parameter) { (response) in
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: response?.result.value!, options: .prettyPrinted)
                let toplistTopTierDomain = try JSONDecoder().decode(ToplistTopTierDomain.self, from: jsonData)
                self.topList = toplistTopTierDomain
            }
            catch {  return }
        } failure: { (error) in
            return
        }
        
    }
    
}

struct CryptoCompareNetworkServiceSUT {
    public static let baseURL = "https://min-api.cryptocompare.com/"
    public static let method: HTTPMethod = .get
    let networkService: CryptoCompareNetworkService
    let timeout: TimeInterval
}

extension XCTest {
    
    func makeSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 30
        configuration.timeoutIntervalForRequest = 30
        return configuration
    }
    
    func makeSession() -> SessionManager {
        let session = SessionManager(configuration: self.makeSessionConfiguration())
        return session
    }
    
    func makeCryptoCompareNetworkServiceSUT() -> CryptoCompareNetworkServiceSUT {
        let session = self.makeSession()
        let networkService = CryptoCompareNetworkService(session: session)
        return CryptoCompareNetworkServiceSUT(networkService: networkService, timeout: session.session.configuration.timeoutIntervalForRequest)
    }
    
}
