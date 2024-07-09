//
//  VersionControlRequestModel.swift
//  GlobalLoginApp
//
// Created by Onur ÇAM on 17.04.2024.
//

import Foundation

struct VersionControlRequestModel: Codable {
    
    
    let version : String?
    let platform : String?
    
    
}

struct VersionMockRequest {
    var version : String = "61"
    var platform : String = "IOS"
    
    func versionRequest() -> VersionControlRequestModel {
        return VersionControlRequestModel( version: version, platform: platform)
    }
}
