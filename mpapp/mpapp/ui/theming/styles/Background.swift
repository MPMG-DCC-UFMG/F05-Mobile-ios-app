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
