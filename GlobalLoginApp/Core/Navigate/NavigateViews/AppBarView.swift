//
//  AppBarView.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 7.07.2024.
//

import SwiftUI

struct AppBarView: View {
    @ObservedObject var router = NavigationRouter.shared
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    let backgroundColor : Color?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background( backgroundColor ??
            Color.blue
        )
        
    }
}

#Preview {
    VStack{
        AppBarView(showBackButton: true, title: "Title here", subtitle: "Subtitle goes here", backgroundColor: .blue)
        Spacer()
    }}


extension AppBarView {
    
    private var backButton: some View {
        Button(action: {
            NavigationRouter.shared.goBack()
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    
    private var titleSection: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
    
}
