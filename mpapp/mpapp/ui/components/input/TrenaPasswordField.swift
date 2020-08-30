import SwiftUI

struct TrenaPasswordField: View {
    var label: String
    var placeHolder: String
    
    @State var input = ""
    @State private var hide = true
    
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
                if self.hide{
                    SecureField(placeHolder, text: $input).foregroundColor(ColorProvider.white)
                    .h2()
                }else{
                    TextField(placeHolder, text: $input).foregroundColor(ColorProvider.white)
                    .h2()
                }
                
                Button(action:{
                    self.hide.toggle()
                }){
                    Image(systemName: self.hide ?"eye.fill" :  "eye.slash.fill" )
                        .foregroundColor(self.hide ? ColorProvider.white : ColorProvider.greenTrena )
                }.padding(.trailing, 15)
                
            }
            .inputField()
        }
    }
}

struct TrenaPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        TrenaPasswordField("Oi", label: "Email", placeHolder: "teste")
    }
}
