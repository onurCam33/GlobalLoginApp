//
//  AlertSettingView.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 30.03.2024.
//

import SwiftUI

struct AlertDialogView: View {
    let screen = UIScreen.main.bounds
    @Binding var isShowing : Bool
    var alertModel : AlertModel?
    var title : String?
    var subTitle : String?
    var onDone : () -> Void = {  }
    // var onPressed : (() -> Void)? = nil
    var onCancel : () -> Void = {}
    var body: some View {
        
        VStack(spacing: 20){
            Text((title ?? alertModel?.title) ?? "")
                .font(.system(size: 20, weight: .bold))
            Text((subTitle ?? alertModel?.subTitle) ?? "")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 20){
                Button {
                    
                    (alertModel?.onPressed ?? onDone)()
                    isShowing = false
                } label: {
                    Text("Okey")
                }
                
                Button {
                    isShowing = false
                } label: {
                    Text("Cancel")
                }
                
                
            }
            .padding()
        }
        .padding()
        .frame(width: screen.width * 0.9, height: screen.height * 0.25)
        .background(Color(#colorLiteral(red: 0.9268686175, green: 0.9416290522, blue: 0.9456014037, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(y: isShowing ? 0 : screen.height)
        .animation(.spring(), value: isShowing)
        .shadow(color: Color(#colorLiteral(red: 0.8596749902, green: 0.854565084, blue: 0.8636032343, alpha: 1)), radius: 6, x: -9, y: -9)
        
        
    }
}

struct AlertDialogView_Previews: PreviewProvider {
    static var previews: some View {
        AlertDialogView(isShowing: .constant(true), alertModel: .location)
    }
}

enum AlertModel  {
    case location
    
    var title : String {
        switch self {
            case .location : return "Location permission required"
        }
    }
    var subTitle : String {
        switch self {
            case .location : return "You need to share your location to use the application."
        }
    }
    var onPressed : (() -> Void)? {
        switch self {
            case .location : return {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
}
