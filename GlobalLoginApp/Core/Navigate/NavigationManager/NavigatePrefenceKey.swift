//
//  NavigatePrefenceKey.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM 2 on 7.07.2024.
//

import Foundation

import SwiftUI

struct AppBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
struct AppBarSubtitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
    
}

struct AppBarBackButtonPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct AppBarBackgroundColorPreferenceKey: PreferenceKey {
    static func reduce(value: inout Color, nextValue: () -> Color) {
        value = nextValue()
    }
    
    
    static var defaultValue: Color = .blue
    
   
}

extension View {
    
    func appBartitle(_ title: String) -> some View {
        preference(key: AppBarTitlePreferenceKey.self, value: title)
    }
    
    func appBarSubtitle(_ subtitle: String?) -> some View {
        preference(key: AppBarSubtitlePreferenceKey.self, value: subtitle)
    }
    
    func appBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: AppBarBackButtonPreferenceKey.self, value: hidden)
    }
    func appBarBackgroundColor(_ color: Color) -> some View {
        preference(key: AppBarBackgroundColorPreferenceKey.self, value: color)
    }
    func appBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false, backgroundColor: Color = .blue) -> some View {
        self
            .appBartitle(title)
            .appBarSubtitle(subtitle)
            .appBarBackButtonHidden(backButtonHidden)
            .appBarBackgroundColor(backgroundColor)
    }
    
}
