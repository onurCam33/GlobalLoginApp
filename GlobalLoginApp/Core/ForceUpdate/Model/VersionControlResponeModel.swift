//
//  VersionControlResponeModel.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 17.04.2024.
//

import Foundation


struct VersionControlResponseModel: Codable {
    let data : VersiyonData?
    let errorInfo : String?
    let errorCode : String?
    let success : Bool?
    
    enum CodingKeys: String, CodingKey {
        case errorInfo, errorCode, success, data
    }
    
    init(from decoder: Decoder) throws {
        var convertData : VersiyonData?
        let container = try decoder.container(keyedBy: CodingKeys.self)
        errorInfo = try container.decodeIfPresent(String.self, forKey: .errorInfo)
        errorCode = try container.decodeIfPresent(String.self, forKey: .errorCode)
        success = try container.decodeIfPresent(Bool.self, forKey: .success)
        
        if let dataString = try container.decodeIfPresent(String.self, forKey: .data) {
            if let jsonData = dataString.data(using: .utf8) {
                do {
                    let decoder = JSONDecoder()
                    convertData = try decoder.decode(VersiyonData.self, from: jsonData)
                    
                } catch {
                    print("JSON çözümleme hatası: \(error.localizedDescription)")
                }
            }
            data = convertData
        } else {
            print("Veri bir String değildir.")
            data = nil
        }
    }
}


struct VersiyonData : Codable {
    
    let  isUpDate : Bool?
    let  isNeccessary : Bool?
    let  lastVersion : String?
    let  link : String?
    let  explanation : String?
    
}
