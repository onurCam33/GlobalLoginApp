//
//  NetworkEnum.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 5.04.2024.
//

import Foundation

enum NetworkError: Error {
    case BadURL
    case NoData(String?)
    case DecodingError(String?)
    case APIError(String?)
    case InvalidStatusCode(String?)
    case EncodingError(String?)
    case timeOut
    case unknownError(String?)
    case badRequest
    case urlSessionFailed(_ error: URLError)
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case unauthorized
    case forbidden
    case notFound
    
    
    
}

enum NetworkResult<T> {
    case success(T)
    case failure(NetworkError)
    
}


enum NetworkRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError( _ description: String)
    case urlSessionFailed(_ error: URLError)
    case timeOut
    case unknownError
    
    
}
