//
//  NetworkManager.swift
//  GlobalLoginApp
//
//   Created by Onur ÇAM on 5.04.2024.
//

import Foundation

enum HttpMethod {
    case post
    
    var name: String {
        switch self {
            case .post:
                return "POST"
        }
    }
}

final class NetworkManager {
    static let instance = NetworkManager()
    
    var route : MyRequestConvertible
    
    let apiClient : ApiClient?
    private init() {
        
        let headers : [String : String] = [
            "accept": "*/*",
            "Content-Type": "application/json-patch+json",
            "Access-Control-Allow-Origin": "*",
            "Authorization": ServiceConstants.basicAuth,
        ]
        
        self.route = MyRequestConvertible(headers: headers)
        apiClient = ApiClient(route: self.route)
    }
    
    
}

struct MyRequestConvertible  {
    var path: String?
    var method : HttpMethod?
    let headers : [String : String]?
    var httpBody : Data?
    init(headers : [String : String], path : String? = "") {
        self.path = path
        self.method = HttpMethod.post
        self.headers = headers
        
    }
    func asURLRequest() -> URLRequest {
        let url = URL(string: ServiceConstants.baseUrl+(self.path ?? "") )!
        var request: URLRequest = URLRequest(url : url)
        request.url = url
        request.httpMethod = method?.name
        request.allHTTPHeaderFields = self.headers
        request.httpBody = self.httpBody
        return request
    }
    
}
