//
//  SignInService.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 20.05.2024.
//

import Foundation



struct SignInService : SignInServiceProtocol {
    func send( parseModel: SignInRequestModel?) async -> SignInResponseModel?  {
        do {
            if let response = try await NetworkManager.instance.apiClient?.send(type: SignInResponseModel.self, path: ServiceConstants.signIn, parseModel: parseModel) {
                switch response {
                    case .success(let data) : return data
                        
                    case .failure(let error) : print("Errors:  \(error.localizedDescription)")
                }
            }
            else {
                print("")
            }
            
        }catch {
            
        }
        return nil
    }
    
    
    
    
}
