import SwiftUI

struct TrenaTextField: View {
    var label: String
    var placeHolder: String
    
    @Binding var input :String
    @State private var editing = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label.uppercased())
                .h5(color: ColorProvider.white)
                .padding(.leading,8)
            HStack {
                TextField(placeHolder, text: $input,
                          onEditingChanged: { edit in
                            self.editing = edit
                }).foregroundColor(ColorProvider.white)
                    .h2(color: ColorProvider.white)
            }
            .inputField(editing: editing)
        }
    }
}

struct TrenaTextField_Previews: PreviewProvider {
    @State static var input = "Oi"
    static var previews: some View {
        TrenaTextField(label: "Email", placeHolder: "teste",input: $input)
    }
}
