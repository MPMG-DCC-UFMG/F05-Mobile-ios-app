import Foundation
import SwiftUI

extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
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
        case .button4:
            return self.modifier(ButtonStyle(enabled: enabled, buttonEnabled: ColorProvider.grey1, buttonTextEnabled: ColorProvider.white))
        case .button5:
            return self.modifier(ButtonStyle(enabled: enabled, buttonEnabled: ColorProvider.red, buttonTextEnabled: ColorProvider.grey1))
        default:
            return self.modifier(ButtonStyle(enabled: enabled))
        }
    }
    
    func smallButtonStyle(_ enabled: Bool = true, style: SmallButtonStyleEnum = .smallButton1) -> some View{
        switch style {
        case .smallButton1:
            return self.modifier(SmallButtonStyle(enabled: enabled, buttonEnabled: ColorProvider.grey2, buttonTextEnabled: ColorProvider.greenTrena))
        case .smallButton2:
            return self.modifier(SmallButtonStyle(enabled: enabled, buttonEnabled: ColorProvider.grey3, buttonTextEnabled: ColorProvider.white))
        }
    }
}

extension Image{
    func imageStyle() -> some View{
        return self.renderingMode(.original)
            .resizable()
            .scaledToFit()
    }
}
