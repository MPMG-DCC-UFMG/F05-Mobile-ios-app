import SwiftUI

struct InputTextView: View {
    var label: String
    var placeHolder: String
    var buttonImage: String? = nil
    var buttonAction: (() -> Void)? = nil
    
    @State var input = ""
    @State private var editing = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label.uppercased())
                .scaledFont(name: FontProvider.gothamRoundedMedium,size: 12)
                .foregroundColor(ColorProvider.white)
            HStack {
                TextField(placeHolder, text: $input,
                          onEditingChanged: { edit in
                            self.editing = edit
                }).textFieldStyle(TrenaTextFieldStyle(focused: $editing))
                if(self.buttonImage != nil){
                    Button(action: {self.buttonAction!()}) {
                        Image(buttonImage!)
                            .foregroundColor(.secondary)
                       }
                }
            }
        }
    }
}

struct InputTextView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextView(label: "Email", placeHolder: "teste",buttonImage: "show")
    }
}
