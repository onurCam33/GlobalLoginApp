//
//  SecondView.swift
//  GlobalLoginApp
//
//Created by Onur ÇAM on 8.07.2024.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        AppView {
            VStack {
                Text("Detail View")
                Button("Go Back") {
                    NavigationRouter.shared.goBack()
                }
                //.appBartitle("Detail View")
                .appBarItems(title: "Detail View",backgroundColor: .red)
                
            }
        }
    }
}
#Preview {
    SecondView()
}
