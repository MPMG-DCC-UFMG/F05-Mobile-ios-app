import SwiftUI

struct TrenaLoading: View {
    
    @State private var isLoading = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(ColorProvider.greenTrena, lineWidth: 10)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }
    }
}

struct TrenaLoading_Previews: PreviewProvider {
    static var previews: some View {
        TrenaLoading()
    }
}
