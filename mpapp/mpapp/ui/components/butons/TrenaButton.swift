import SwiftUI

struct TrenaButton: View {
    var label: String
    var image: String? = nil
    var style: ButtonStyleEnum = .button1
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
            }
            .buttonStyle(enabled,style:style)
        }.disabled(!enabled)
    }
}

struct TrenaButton_Previews: PreviewProvider {
    static var previews: some View {
        TrenaButton(label: "Editar",image: "trash",style:.button2, action: {})
    }
}
