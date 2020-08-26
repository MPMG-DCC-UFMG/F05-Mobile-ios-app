import Foundation
import SwiftUI

struct TrenaTextFieldStyle: TextFieldStyle {
    @Binding var focused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .scaledFont(name: FontProvider.gothamRoundedMedium,size: 12)
        .foregroundColor(ColorProvider.white)
        .padding(10)
        .frame(height: 48)
        .background(ColorProvider.grey1)
        .cornerRadius(4.0)
        .background(
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .stroke(focused ? ColorProvider.greenTrena : ColorProvider.grey4, lineWidth: 3)
        )
    }
}
