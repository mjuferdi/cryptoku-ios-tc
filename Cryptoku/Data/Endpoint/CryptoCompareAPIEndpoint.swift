//
//  CryptoCompareAPIEndpoint.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Alamofire
import Foundation

public typealias NetworkSuccessHandler = (Alamofire.DataResponse<Any>?) -> Void
public typealias NetworkFailureHandler = (Alamofire.DataResponse<Any>?) -> Void

public struct CryptoCompareNetworkService {
    
    public static let baseURL = "https://min-api.cryptocompare.com/data/top/totaltoptiervolfull"
    public static let method: HTTPMethod = .get
    
    // MARK: Toplist by 24H Top Tier Volume Full Data
    public func fetchToplistTopTier(
        parameters: [String: Any]?,
        success: NetworkSuccessHandler?,
        failure: NetworkFailureHandler?){
        
        let headers = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(CryptoCompareNetworkService.baseURL, method: CryptoCompareNetworkService.method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (responseJSON) in
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
