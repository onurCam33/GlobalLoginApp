//
//  RouteEnum.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 7.07.2024.
//

import Foundation
import SwiftUI
enum Route {
    case home
    case second
    
    @ViewBuilder
    func rootView() -> some View {
        switch self {
            case .home:
                HomeView()
            case .second:
                SecondView()
        }
    }
}
