import SwiftUI

struct TrenaPasswordField: View {
    var label: String
    var placeHolder: String
    
    @Binding var input :String
    @State private var hide = true

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
    @State static var input = "Oi"
    static var previews: some View {
        TrenaPasswordField(label: "Email", placeHolder: "teste", input: $input)
    }
}
