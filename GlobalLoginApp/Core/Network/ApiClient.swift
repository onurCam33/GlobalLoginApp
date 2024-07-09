//
//  ApiClient.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 5.04.2024.
//

import Foundation
import Network

protocol ApiClientProtocol {
    func send<T: Codable, R: Encodable>(
        type : T.Type,
        path : String,
        parseModel : R
    ) async throws -> NetworkResult<T>?
    
}
class ApiClient  : ApiClientProtocol {
    
    private var route : MyRequestConvertible
    
    init(route : MyRequestConvertible) {
        self.route = route
    }
    
    func send<T : Codable, R: Encodable>(type: T.Type, path: String, parseModel: R) async throws -> NetworkResult<T>? {
        
        let isNetwork : Bool = ApiClientHelper.isConnectedToNetwork()
        
        if isNetwork {
            do {
                return try await apiClient(type: T.self, parseModel: parseModel, path: path)
            }catch {
                print("send function error occurred.")
            }
        }
        return nil
    }
    
    private func apiClient<T: Codable, R: Encodable>(type: T.Type, parseModel: R , path: String)async throws -> NetworkResult<T>?  {
        
        let result = ApiClientHelper.dataEncoder(parseModel: parseModel)
        
        switch result {
            case let (nil, error) where error != nil: return .failure(NetworkError.unknownError("httpBody  error : \(error!)"))
            case let (data, nil) where data != nil : self.route.httpBody = data
            default : return .failure(NetworkError.unknownError("Unknown error while creating httpBody"))
        }
        self.route.path = path
        self.route.httpBody = result.0
        let router : URLRequest = self.route.asURLRequest()
        
        do {
            let (data, response) = try await  URLSession.shared.data(for:router)
            return ApiClientHelper.dataCodable(type: T.self, data: data, response: response)
        } catch {
            return .failure(NetworkError.unknownError("service error part 1"))
        }
        
        
    }
}


fileprivate struct ApiClientHelper {
    
    static func dataEncoder(parseModel : Encodable) -> (Data?, NetworkError?) {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(parseModel) else {
            return (nil, NetworkError.EncodingError("Failed to encode data"))
        }
        
        guard let dataString = String(data: data, encoding: .utf8) else {
            return (nil, NetworkError.EncodingError("Failed to convert data to string"))
        }
        guard let parameters = convertToDictionary(text: dataString) else {
            
            return (nil, NetworkError.EncodingError("Failed to convert data to utf8"))
        }
        do {
            let parseModel = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
            return (parseModel, nil)
        }catch {
            return (nil, NetworkError.EncodingError("parseModel has encountered an error while trying to convert it to a JSON object."))
        }
    }
    
    static func dataCodable<T : Decodable>(type: T.Type, data : Data?, response : URLResponse) -> NetworkResult<T> {
        
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(NetworkError.unknownError("dataCodable funksiyonu response tanınmadı."))
        }
        if !(200...299).contains(httpResponse.statusCode) {
            print("httpResponse.statusCode : \(httpResponse.statusCode)")
            return .failure(httError(statusCode: httpResponse.statusCode))
        }
        
        guard let data = data else {
            return .failure(NetworkError.NoData("Data could not be retrieved"))
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            return .failure(NetworkError.DecodingError("Data decoding error"))
        }
        
        return .success(decodedData )
    }
    
    
    static func httError(statusCode : Int) -> NetworkError {
        switch statusCode {
            case 400: return .badRequest
            case 401: return .unauthorized
            case 403: return .forbidden
            case 404: return .notFound
            case 402, 405...499: return .error4xx(statusCode)
            case 500: return .serverError
            case 501...599: return .error5xx(statusCode)
            default: return .unknownError("dsfsdfsdfsdfsdfs")
        }
    }
    
    static func isConnectedToNetwork()  -> Bool {
        let connectivityResult =  NWPathMonitor().currentPath.status
        
        switch connectivityResult {
            case .satisfied, .unsatisfied:
                return true
            default:
                return false
        }
    }
    static func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                let request = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                return request
            } catch {
                print("convertToDictionary fonksiyonu : \(error.localizedDescription)")
            }
        }
        return nil
    }
}
