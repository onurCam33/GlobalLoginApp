//
//  ScreenSizeModel.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 9.07.2024.
//

import Foundation
import SwiftUI

class ScreenSizeModel: ObservableObject {
    @Published var deviceWidth: CGFloat = UIScreen.current?.bounds.size.width ?? 0
    @Published var deviceHeight: CGFloat = UIScreen.current?.bounds.size.height ?? 0
}
