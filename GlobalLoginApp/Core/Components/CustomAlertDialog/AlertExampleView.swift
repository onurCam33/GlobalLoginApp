//
//  AlertExampleView.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 31.03.2024.
//


import SwiftUI

struct AlertExampleView: View {
    @State var title : String
    @State var subTitle : String
    @State var onDone : () -> Void = {}
    @State var onCancel : () -> Void = {}
    @State var isShowing : Bool = false
    var body: some View {
        ZStack{
            
            VStack{
                // Text(title)
                Button(isShowing ? "" : "Buttton")
                {
                isShowing = true
                self.title = "VİEW TİTLE"
                self.subTitle = "View SubTitle"
                }
            }
            
            //            AlertDialogView(isShowing: $isShowing, title: title, subTitle: subTitle, onPressed: {
            //                if let url = URL(string: UIApplication.openSettingsURLString) {
            //                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //                }
            //            })
        }
    }
}

struct AlertExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AlertExampleView(title: "", subTitle: "")
    }
}
