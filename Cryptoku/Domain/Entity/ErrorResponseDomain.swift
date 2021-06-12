//
//  ErrorResponseDomain.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import Foundation

struct ErrorResponseDomain: Codable {
    let error: ResponseError
}

struct ResponseError: Codable {
    let code: String?
    let httpCode: Int?
    let message: String?
    let errorDetails: [ErrorDetail]?
    
    enum CodingKeys: String, CodingKey {
        case code
        case httpCode = "http_code"
        case message
        case errorDetails = "error_details"
    }
}

struct ErrorDetail: Codable {
    let field, message: String
}
