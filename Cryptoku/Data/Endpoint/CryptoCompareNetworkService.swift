//
//  CryptoCompareNetworkService.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Alamofire
import Foundation

public typealias NetworkSuccessHandler = (Alamofire.DataResponse<Any>?) -> Void
public typealias NetworkFailureHandler = (Alamofire.DataResponse<Any>?) -> Void

public struct CryptoCompareNetworkService {
    
    //public static let baseURL = "https://min-api.cryptocompare.com/data/top/totaltoptiervolfull"
    public static let baseURL = "https://min-api.cryptocompare.com/"
    public static let method: HTTPMethod = .get
    
    // MARK: Endpoint Path
    private static let toplistPath = "data/top/totaltoptiervolfull"
    private static let newsCategoryPath = "data/v2/news/"

    
    let session: SessionManager
    public init(session: SessionManager = .default) {
        self.session = session
    }
    
    // MARK: Toplist by 24H Top Tier Volume Full Data
    public func fetchToplistTopTier(
        parameters: [String: Any]?,
        success: NetworkSuccessHandler?,
        failure: NetworkFailureHandler?){
        
        let headers = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(CryptoCompareNetworkService.baseURL + CryptoCompareNetworkService.toplistPath, method: CryptoCompareNetworkService.method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (responseJSON) in
            #if DEV
            let _request = """
            ⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️
            \(responseJSON)
            """
            print(_request)
            #endif
            guard let response = responseJSON.response else {
                return
            }
            
            if response.statusCode >= 400 {
                failure?(responseJSON)
            } else {
                success?(responseJSON)
            }
        }
    }
    
    // MARK: Toplist by 24H Top Tier Volume Full Data
    public func fetchNewsByCategory(
        parameters: [String: Any]?,
        success: NetworkSuccessHandler?,
        failure: NetworkFailureHandler?){
        
        let headers = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(CryptoCompareNetworkService.baseURL + CryptoCompareNetworkService.newsCategoryPath, method: CryptoCompareNetworkService.method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (responseJSON) in
            #if DEV
            let _request = """
            ⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️
            \(responseJSON)
            """
            print(_request)
            #endif
            guard let response = responseJSON.response else {
                return
            }
            
            if response.statusCode >= 400 {
                failure?(responseJSON)
            } else {
                success?(responseJSON)
            }
        }
    }
    
    
}
