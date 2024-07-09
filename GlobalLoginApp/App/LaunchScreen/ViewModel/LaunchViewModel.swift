//
//  LaunchViewModel.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 17.04.2024.
//

import Foundation
import SwiftUI

class LaunchViewModel: ObservableObject {
    // MARK : Screen text animation variables
    @Published  var loadingText: [String] = "Mobile App Launching...".map { String($0) }
    @Published  var showLoadingText: Bool = false
    @Published  var counter: Int = 0
    @Published  var loops: Int = 0
    @Published var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Published var showLaunchView: Bool?
    private var versionViewModel = VersionControlViewModel()
    @ObservedObject var locationManager = LocationManager.shared
    @Published var isUpdate : Bool = false
    
    
    func versionControl() async  {
        
        let response = await versionViewModel.getVersionService()
        let deviceVersion = Int(versionViewModel.deviceAppVersion )
        let serviceVersion = Int(response?.data?.lastVersion ?? "0")
        if(serviceVersion! >= deviceVersion!){
            print("launcviewModel version info  \(String(describing: serviceVersion))")
        }
        else {
            print("launcview version info error")
        }
    }
}

