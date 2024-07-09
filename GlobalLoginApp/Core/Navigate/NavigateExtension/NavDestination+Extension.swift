//
//  NavDestination+Extension.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 7.07.2024.
//

import Foundation
import SwiftUI

extension View {
    
    func customNavDestination() -> some View  {
        self
            .navigationDestination(for: Route.self) { route in
                route.rootView()
            }
    }
    }
