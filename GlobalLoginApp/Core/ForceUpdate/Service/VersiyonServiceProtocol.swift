//
//  VersiyonServiceProtocol.swift
//  GlobalLoginApp
//
//   Created by Onur ÇAM on 17.04.2024.
//

import Foundation

protocol VersionControlProtocol {
    
    func send( parseModel: VersionControlRequestModel) async -> VersionControlResponseModel?
    
    func getAppVersion() -> String?
}

