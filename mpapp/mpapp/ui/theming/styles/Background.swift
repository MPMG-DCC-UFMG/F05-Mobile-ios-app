import Foundation
import SwiftUI

struct InputField: ViewModifier {
    var editing: Bool = true
    
    func body(content: Content) -> some View {
        content
        .frame(height: 48.0)
        .padding(.leading, 15)
        .background(ColorProvider.grey1)
        .cornerRadius(4)
        .overlay(RoundedRectangle(cornerRadius: 4).stroke(editing ? ColorProvider.greenTrena : ColorProvider.grey4, lineWidth: 2)
        )
    }
}

struct ButtonStyle: ViewModifier{
    var enabled: Bool = true
    var buttonDisabled: Color = ColorProvider.grey4
    var buttonEnabled: Color = ColorProvider.greenTrena
    var buttonTextDisabled: Color = ColorProvider.grey5
    var buttonTextEnabled: Color = ColorProvider.darkBackground
    
    func body(content: Content) -> some View{
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 25)
            .padding()
            .foregroundColor(textColor())
            .background(backgroundColor())
            .cornerRadius(4)
    }
    
    private func backgroundColor() -> Color{
        return self.enabled ? buttonEnabled : buttonDisabled
    }
    
    private func textColor() -> Color{
        return self.enabled ? buttonTextEnabled : buttonTextDisabled
    }
}

enum ButtonStyleEnum{
    case button1
    case button2
    case button3
}
