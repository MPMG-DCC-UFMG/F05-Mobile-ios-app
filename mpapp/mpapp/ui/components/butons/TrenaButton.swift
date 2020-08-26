import SwiftUI

struct TrenaButton: View {
    var label: String
    var image: String? = nil
    var action: () -> Void
    var enabled: Bool = true
    
    var body: some View {
       Button(action: action) {
            HStack {
                if image != nil {
                    Image(systemName: image!)
                    .font(.system(size: 18.0))
                }
                Text(label)
                    .buttonTextStyle(color:textColor())
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 25)
            .padding()
            .foregroundColor(textColor())
            .background(backgroundColor())
            .cornerRadius(4)
        }.disabled(!enabled)
    }
    
    private func backgroundColor() -> Color{
        return self.enabled ? ColorProvider.greenTrena : ColorProvider.grey4
    }
    
    private func textColor() -> Color{
        return self.enabled ? ColorProvider.darkBackground : ColorProvider.grey5
    }
}

struct TrenaButton_Previews: PreviewProvider {
    static var previews: some View {
        TrenaButton(label: "Editar",image: "trash",action: {})
    }
}
