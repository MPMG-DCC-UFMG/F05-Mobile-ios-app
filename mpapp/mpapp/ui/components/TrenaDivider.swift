import SwiftUI

struct TrenaDivider: View {
    let color: Color = ColorProvider.white
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct TrenaDivider_Previews: PreviewProvider {
    static var previews: some View {
        TrenaDivider()
    }
}
