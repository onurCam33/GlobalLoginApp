//
//  SignInRequestModel.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 6.04.2024.
//

import Foundation

struct SignInRequestModel: Encodable {
    let ipNumber, longitude, latitude: String?
    let UserNumber: Int?
    let password, deviceID : String?
    
    enum CodingKeys: String, CodingKey {
        case ipNumber, longitude, latitude,  UserNumber, password
        case deviceID = "deviceID"
        
    }
}


struct requestModelBuild {
    var ipNumber : String =  "192."
    var longitude : String =  "0.0"
    var latitude : String =  "0.0"
    var UserNumber : Int =  123456
    var password : String =  "4297f44b1395356y3445rg34245gerwwf"
    var deviceID : String =  ""
    
    func loginResquestModel() -> SignInRequestModel {
        return SignInRequestModel(ipNumber: ipNumber, longitude: longitude, latitude: latitude, UserNumber: UserNumber, password: password, deviceID: deviceID)
    }
    
}
