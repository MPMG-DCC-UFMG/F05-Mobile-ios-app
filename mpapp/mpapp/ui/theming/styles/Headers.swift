import Foundation
import SwiftUI

struct FirstHeader: ViewModifier {
    var textColor: Color = Color.white
    func body(content: Content) -> some View {
        content
            .scaledFont(name: FontProvider.gothamBold, size: 20)
        .foregroundColor(textColor)
    }
}

struct SecondHeader: ViewModifier {
    var textColor: Color
    func body(content: Content) -> some View {
        content
            .scaledFont(name: FontProvider.gothamRoundedBook, size: 16)
        .foregroundColor(textColor)
    }
}

struct ThirdHeader: ViewModifier {
    var textColor: Color
    func body(content: Content) -> some View {
        content
            .scaledFont(name: FontProvider.gothamRoundedMedium, size: 14)
        .foregroundColor(textColor)
    }
}

struct ForthHeader: ViewModifier {
    var textColor: Color
    func body(content: Content) -> some View {
        content
            .scaledFont(name: FontProvider.gothamRoundedBook, size: 14)
        .foregroundColor(textColor)
    }
}

struct FifthHeader: ViewModifier {
    var textColor: Color
    func body(content: Content) -> some View {
        content
            .scaledFont(name: FontProvider.gothamRoundedMedium, size: 12)
        .foregroundColor(textColor)
    }
}

struct ButtonTextStyle: ViewModifier {
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .scaledFont(name: FontProvider.gothamRoundedMedium, size: 16)
        .foregroundColor(textColor)
    }
}
