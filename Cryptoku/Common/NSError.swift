//
//  NSError.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Foundation

public extension NSError {
    
    class func create(with message: String, code: Int = -100, userInfo: [String: Any]? = nil) -> NSError {
        return NSError(domain: message, code: code, userInfo: userInfo)
    }
    
}
