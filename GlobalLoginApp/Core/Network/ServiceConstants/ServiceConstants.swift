//
//  ServiceConstants.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 5.04.2024.
//

import Foundation

struct ServiceConstants {
    // Service Params
    static let baseUrl = "https://mobileGlobalLogin.com/AppBaseMobilPath/"
    static let serviceTimeout: TimeInterval = 30
    static let signIn = "api/SignIn"
    static let versionControl = "api/GetVersion"
    
    static let basicAuthUserPass = "globalBasicAuth"
    static var basicAuth: String {
        let authString = "\(basicAuthUserPass)"
        if let data = authString.data(using: .utf8) {
            let base64String = data.base64EncodedString()
            return "Basic \(base64String)"
        }
        return ""
    }
}
