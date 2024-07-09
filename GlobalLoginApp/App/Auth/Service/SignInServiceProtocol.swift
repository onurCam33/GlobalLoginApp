//
//  SignInServiceProtocol.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 20.05.2024.
//

import Foundation

protocol SignInServiceProtocol {
    
    func send( parseModel: SignInRequestModel?) async -> SignInResponseModel?
    
    
}
