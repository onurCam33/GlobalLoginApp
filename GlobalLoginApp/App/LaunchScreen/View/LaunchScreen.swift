//
//  LaunchScreen.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 28.03.2024.
//

import SwiftUI


struct LaunchView: View {
    @StateObject private var launchViewModel = LaunchViewModel()
    @StateObject private var versionViewModel = VersionControlViewModel()
    @ObservedObject var locationManager = LocationManager.shared
    @Binding var showLaunchView: Bool
    
    var body: some View {
        if #available(iOS 17.0, *) {
            ZStack{
                Color.launch.launchBackgroundColor
                    .ignoresSafeArea()
                VStack{
                    launchImage
                    showAnimateText
                }
            }
            .onAppear{
                Task{
                    await launchViewModel.versionControl()
                    locationManager.requestLocation()
                }
            }
            
            .onReceive(launchViewModel.timer, perform: { _ in
                withAnimation(.spring()) {
                    
                    let lastIndex = launchViewModel.loadingText.count - 1
                    if launchViewModel.counter == lastIndex {
                        launchViewModel.counter = 0
                        launchViewModel.loops += 1
                        showLaunchView = false
                        
                    } else {
                        launchViewModel.counter += 1
                    }
                }
            })
        } else {
            // Fallback on earlier versions
        }
        
    }
}


extension LaunchView {
    private var showAnimateText : some View {
        
        ZStack{
            if launchViewModel.showLoadingText {
                HStack(spacing: 0) {
                    ForEach(launchViewModel.loadingText.indices, id: \.self) { index in
                        Text(launchViewModel.loadingText[index])
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.theme.secondaryColor)
                            .offset(y: launchViewModel.counter == index ? -5 : 0)
                    }
                    
                }
                .transition(AnyTransition.scale.animation(.easeIn))
                .offset(y: 70)
            }
        }
    }
    
    private var launchImage : some View {
        
        Image("loginLogo")
            .resizable()
            .frame(width: 300,height: 300)
    }
    
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView( showLaunchView: .constant(true))
    }
}
