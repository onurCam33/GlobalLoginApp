//
//  AppCoreView.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 28.03.2024.
//

import SwiftUI

struct AppCoreView: View {
    @StateObject private var viewModel = LaunchViewModel()
    var screenSizeModel = ScreenSizeModel()
    @ObservedObject var locationManager = LocationManager.shared
    @State  var routes: [Route] = []
    @State private var showLaunchView = true
    
    var body: some View {
        if showLaunchView {
            LaunchView(showLaunchView: $showLaunchView)
                .environmentObject(screenSizeModel)
        }
        else {
           
                SignInView()
                   .environmentObject(screenSizeModel)
           
           
        }
        
        
    }
}

struct AppCoreView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoreView()
    }
}
