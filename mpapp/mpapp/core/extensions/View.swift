import Foundation
import SwiftUI

extension View {
    
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size:size))
    }
    
    func h1(color: Color = ColorProvider.white) -> some View {
        return self.modifier(FirstHeader(textColor: color))
    }
    
    func h2(color: Color = ColorProvider.white) -> some View{
        return self.modifier(SecondHeader(textColor: color))
    }
    
    func h3(color: Color = ColorProvider.white) -> some View{
        return self.modifier(ThirdHeader(textColor: color))
    }
    
    func h4(color: Color = ColorProvider.white) -> some View{
        return self.modifier(ForthHeader(textColor: color))
    }
    
    func h5(color: Color = ColorProvider.white) -> some View{
        return self.modifier(FifthHeader(textColor: color))
    }
    
    func buttonTextStyle(color: Color = ColorProvider.darkBackground) -> some View{
        return self.modifier(ButtonTextStyle(textColor: color))
    }
    
    func inputField(editing: Bool = false) -> some View{
        return self.modifier(InputField(editing: editing))
    }
    
    func buttonStyle(_ enabled: Bool = true, style: ButtonStyleEnum = .button1) -> some View{
        switch style {
        case .button2:
            return self.modifier(ButtonStyle(enabled: enabled,
                                             buttonEnabled: ColorProvider.grey2,
                                             buttonTextEnabled: ColorProvider.greenTrena))
        case .button3:
            return self.modifier(ButtonStyle(enabled: enabled,
                                             buttonEnabled: ColorProvider.grey2,
                                             buttonTextEnabled: ColorProvider.red))
        default:
            return self.modifier(ButtonStyle(enabled: enabled))
        }
    }
}
