//
//  HomeView.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 31.03.2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        AppView{
            AppView {
                VStack {
                    Text("Home View")
                    Button("Go to Detail View") {
                        NavigationRouter.shared.navigate(to: .second)
                    }
                    .appBartitle("Home View")
                    .appBarBackButtonHidden(true)
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

