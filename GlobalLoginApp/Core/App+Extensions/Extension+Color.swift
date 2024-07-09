//
//  Extension+Color.swift
//  GlobalLoginApp
//
//   Created by Onur ÇAM on 28.03.2024.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}


struct ColorTheme {
    let primaryColor = Color("PrimaryColor")
    let secondaryColor = Color("SecondaryColor")
    
}

struct LaunchTheme {
    
    let launchBackgroundColor = Color("PrimaryColor")
    
}
//  Daha önce cihaz ekran boyutu aldığımız  bu yapıda "main" kaldırılacağı için (UIScreen.main.bounds.width ) yerine bir uzantı yazıldı.
extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}
