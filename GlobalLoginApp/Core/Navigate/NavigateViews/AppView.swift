//
//  AppView.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 7.07.2024.
//

import SwiftUI

struct AppView <Content : View>: View {
    @ObservedObject var router = NavigationRouter.shared
    let content : Content
    let navBarHiddeen : Bool
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    @State private var backgroundColor : Color? = .blue
    var alertModel : AlertModel?
    @Binding var isShowing : Bool
   
    init(navBarHiddeen : Bool = false, alertModel : AlertModel? = .location,isShowing: Binding<Bool> = .constant(false),@ViewBuilder content: () -> Content) {
        self.navBarHiddeen = navBarHiddeen
        self.content = content()
        self._isShowing = isShowing
        self.alertModel = alertModel
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack{
                VStack(spacing: 0){
                    if !navBarHiddeen {
                        AppBarView(showBackButton: showBackButton, title: title, subtitle: subtitle, backgroundColor: backgroundColor)
                    }
                    content
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .customNavDestination()
                .navigationBarHidden(true)
                .onPreferenceChange(AppBarBackgroundColorPreferenceKey.self, perform: { value in
                    self.backgroundColor = value
                })
                .onPreferenceChange(AppBarTitlePreferenceKey.self, perform: { value in
                    self.title = value
                })
                .onPreferenceChange(AppBarSubtitlePreferenceKey.self, perform: { value in
                    self.subtitle = value
                })
                .onPreferenceChange(AppBarBackButtonPreferenceKey.self, perform: { value in
                    self.showBackButton = !value
                })
                alert
                
            }
        }
        .toolbar(.hidden)
        .navigationBarBackButtonHidden()
    } //
}

#Preview {
    AppView{
        Text("Navigate priview")
    }
}
extension AppView {
    
    private var alert : some View {
        AlertDialogView(isShowing: $isShowing, alertModel: alertModel)
     
    }
}

