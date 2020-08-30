import SwiftUI

struct TrenaTextField: View {
    var label: String
    var placeHolder: String
    
    @State var input = ""
    @State private var editing = false
    
    init(_ defaultValue: String = "", label: String, placeHolder: String) {
        _input = State(initialValue: defaultValue)
        self.label = label
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label.uppercased())
                .foregroundColor(ColorProvider.white)
                .h5()
                .padding(.leading,8)
            HStack {
                TextField(placeHolder, text: $input,
                          onEditingChanged: { edit in
                            self.editing = edit
                    }).foregroundColor(ColorProvider.white)
                .h2()
            }
            .inputField(editing: editing)
        }
    }
}

struct TrenaTextField_Previews: PreviewProvider {
    static var previews: some View {
        TrenaTextField("Oi", label: "Email", placeHolder: "teste")
    }
}
