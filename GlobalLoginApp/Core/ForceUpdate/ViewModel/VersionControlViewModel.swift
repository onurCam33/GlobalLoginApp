//
//  VersionControlViewModel.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 17.04.2024.
//

import Foundation

@MainActor
final class VersionControlViewModel : ObservableObject {
    @Published var versionResponse : VersionControlResponseModel?
    @Published var deviceAppVersion : String = "60"
    @Published var loading : Bool = false
    var service = VersionService()
    
    func getVersionService() async -> VersionControlResponseModel?  {
        
        if let response = await  service.send(parseModel: VersionMockRequest().versionRequest()) {
            self.versionResponse = response
            self.loading = true
            return response
        }
        return nil
    }
}
