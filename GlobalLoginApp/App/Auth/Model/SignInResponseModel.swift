//
//  SignInResponseModel.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 6.04.2024.
//

import Foundation


struct SignInResponseModel: Codable {
    let data: DataClass?
    let errorInfo: String?
    let errorCode: String?
    let success: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case errorInfo, errorCode, success, data
    }
    init(from decoder: Decoder) throws {
        var convertData : DataClass?
        let container = try decoder.container(keyedBy: CodingKeys.self)
        errorInfo = try container.decodeIfPresent(String.self, forKey: .errorInfo)
        errorCode = try container.decodeIfPresent(String.self, forKey: .errorCode)
        success = try container.decodeIfPresent(Bool.self, forKey: .success)
        
        if let dataString = try container.decodeIfPresent(String.self, forKey: .data) {
            if let jsonData = dataString.data(using: .utf8) {
                do {
                    let decoder = JSONDecoder()
                    convertData = try decoder.decode(DataClass.self, from: jsonData)
                    
                } catch {
                    print("JSON parsing error: \(error.localizedDescription)")
                }
            }
            data = convertData
        } else {
            print("Data is not a String.")
            data = nil
        }
    }
}

struct DataClass: Codable {
    let operationStatus: OperationStatus?
    let sessionData: SessionData?
    
    let update: Int?
    
    enum CodingKeys: String, CodingKey {
        case operationStatus, sessionData,  update
    }
}

struct OperationStatus: Codable {
    let isSuccessful: Bool?
    let statusCode: Int?
    let statusDescription: String?
    
    let message: String?
    let instructions: [Any] = []
    
    enum CodingKeys: String, CodingKey {
        case isSuccessful, statusCode, statusDescription, message  // instructions
    }
}


struct SessionData: Codable {
    let countryId, countryName, regionId, regionName, cityId, cityName, districtId, districtName, firstName, lastName, titleId, titleDescription, adminRegistrationId, password, userRegistrationDate, userRegistrationTime, groupId, userStatusId, userStatusDescription, loginDate, loginTime, systemDate : String?
    
}
