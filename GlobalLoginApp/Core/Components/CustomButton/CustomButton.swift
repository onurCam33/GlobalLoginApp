//
//  CustomButton.swift
//  GlobalLoginApp
//
//   Created by Onur ÇAM on 29.03.2024.
//

import SwiftUI



struct CustomButton: View {
    let title : String
    var onPressed : (() -> Void)? = nil
    var body: some View {
        Button(action: {
            onPressed?()
        }, label: {
            Text(title)
                .font(.headline)
                .withDefaultButtonFormatting()
        })
        .withPressableStyle(scaledAmount: 0.9)
        .padding(40)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Button")
    }
}


struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .theme.primaryColor) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
    
}


struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
        //.brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
    
}




extension View {
    
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
    
}
