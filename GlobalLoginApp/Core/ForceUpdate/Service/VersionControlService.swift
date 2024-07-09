//
//  VersionControlService.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 17.04.2024.
//

import Foundation
import SwiftUI

struct VersionService : VersionControlProtocol {
    func send(parseModel: VersionControlRequestModel) async -> VersionControlResponseModel? {
        do {
            if let response = try await NetworkManager.instance.apiClient?.send(type: VersionControlResponseModel.self, path: ServiceConstants.versionControl, parseModel: VersionMockRequest().versionRequest()) {
                switch response {
                    case .success(let data) : return data
                        
                    case .failure(let error) : print("Error: Version Service \(error.localizedDescription)")
                }
            }
            else {
                print("")
            }
            
        }catch {
            
        }
        return nil
    }
    
    func getAppVersion() -> String? {
        return UIDevice.numericUUID ?? ""
    }
    
    
}

