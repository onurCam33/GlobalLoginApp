
//
//  NavigationRouter.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 7.07.2024.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {
    static let shared = NavigationRouter()
    
    @Published var path: [Route] = []
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func goBack() {
        _ = path.popLast()
    }
    
    /* @Published var viewStack: [AnyView] = [AnyView(HomeView())]
     private init() {}
     func navigate<Destination: View>(to destination: Destination) {
     viewStack.append(AnyView(destination))
     }
     func goBack() {
     _ = viewStack.popLast()
     }*/
    
    
}


