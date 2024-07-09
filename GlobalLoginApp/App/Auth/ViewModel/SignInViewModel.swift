//
//  SignInViewModel.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 9.07.2024.
//

import Foundation
import UIKit


@MainActor
final class SignInViewModel: ObservableObject {
    @Published var signInResponseModel : SignInResponseModel?
    var locationManager = LocationManager.shared
    var signInService : SignInService = SignInService()
    var signInRequestModel : SignInRequestModel?
    @Published var privateRoutes: [Route] = []
    @Published var userNumberController: String = ""
    @Published var passwordController: String = ""
    @Published var dataArray: [String] = []
    
    
    func login() async -> Bool  {
        do {
            let signInRequestModel : SignInRequestModel = fillSignInFields()
            let response =  await signInService.send(parseModel: signInRequestModel)
            print("login view model satır 27 : \(String(describing: response))")
            guard let signInResponse = response  else{
                return false
            }
            return signInResponse.success ?? false
            
        }
        
    }
    
    func fillSignInFields() -> SignInRequestModel   {
        _ = UIDevice.numericUUID
        let longitude : String  = String(describing: locationManager.userLocation?.longitude)
        let latitude : String  = String(describing: locationManager.userLocation?.latitude)
        return SignInRequestModel(ipNumber: "192.", longitude: longitude, latitude: latitude,  UserNumber: Int(userNumberController), password: passwordController.MD5, deviceID:"")
        
        
    }
    func checkpermissions() -> Bool {
        if let userLacation = locationManager.locationAccess {
            return userLacation
        }else {
            return false
        }
       }
}

