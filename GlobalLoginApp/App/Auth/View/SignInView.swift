//
//  SignInView.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 9.07.2024.
//


import SwiftUI
import Foundation
import CryptoKit
struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @EnvironmentObject var screenSizeModel: ScreenSizeModel
    @State var isShowing : Bool = false
    
    var body: some View {
        AppView(navBarHiddeen: true, alertModel: .location,isShowing: $isShowing) {
        ZStack {
                VStack(alignment: .leading) {
                    Spacer()
                    loginForm
                    CustomButton(title: "Login") {
                        Task{
                            if  !viewModel.checkpermissions() {
                                isShowing = true
                            }else{
                                let response =  await  viewModel.login()
                                
                                if(response){
                                    print("login process successful")
                                    NavigationRouter.shared.navigate(to: .home)
                                   
                                }else {
                                    print("login failed")
                                }
                                
                            }
                        }
                        // navigator(.push(.homeView))
                        
                    }
                    Spacer()
                    appInfoText
                }
                .background( CustomImageView(imagePath: "background"))
                
            }
        
        }
        
        
    }
}


struct SignInView_Previews: PreviewProvider {
    
    static var previews: some View {
        SignInView().environmentObject(ScreenSizeModel())
    }
}


/// MARK: appInfoText and  loginForm
extension SignInView {
    
    private var loginLogo : some View {
        Image("loginLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 100)
            .foregroundColor(Color.blue)
    }
    private var loginForm : some View {
        VStack {
            VStack {
                /// App logo
                loginLogo
                CustomText(color: Color.theme.primaryColor, size: 30, title: "Mobile Sign In")
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                
                CustomText( title: "User Number")
                CustomTextField(label: "User password", controller: $viewModel.passwordController)
                
            }
            .padding([.trailing, .leading, .top, .bottom], 10)
            
            VStack(alignment: .leading, spacing: 10) {
                
                CustomText( title: "Password")
                CustomTextField(label: "Password", controller: $viewModel.passwordController)
                
            }
            .padding([.trailing, .leading, .top, .bottom], 10)
        }
        
    }
    
    private var appInfoText : some View {
        VStack(alignment: .leading){
            
            Text("Version  :  \(Bundle.main.formattedVersion)")
            Text("Device Id  :  \(UIDevice.numericUUID ?? "")")
            
        }
        .font(.system(size: screenSizeModel.deviceWidth*0.035, weight: .semibold, design: .serif))
        .padding()
    }
    
    
}

/// MARK : CustomImageView
struct CustomImageView : View {
    let imagePath : String
    var body: some View {
        Image(imagePath)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .colorMultiply(Color.theme.primaryColor.opacity(0.5))
    }
}

/// MARK : CustomText
struct CustomText: View {
    var color : Color? = Color.black
    var size : CGFloat?
    var weight : Font.Weight?
    let title : String
    var body: some View {
        Text(title.capitalized)
            .font(.system(size: size ?? 12.0, weight: weight ?? .semibold, design: .default))
            .italic()
            .foregroundColor(color)
    }
}

/// MARK : CustomTextField
struct CustomTextField: View {
    var label : String
    @Binding var controller: String
    
    var body: some View {
        TextField(label,
                  text: $controller)
        .background(Color.white)
        .font(.headline)
        .modifier(TextFieldModifier())
        
    }
}

/// MARK : CustomTextFieldModifier
struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding()
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.black)
    }
}



extension String {
    var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
