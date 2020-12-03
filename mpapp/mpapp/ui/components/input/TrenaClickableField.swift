import SwiftUI

struct TrenaClickableField: View {
    var label: String
    var input: String
    var image: String = "chevron.down"
    var hint: String = ""
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label.uppercased())
                .foregroundColor(ColorProvider.white)
                .h5()
                .padding(.leading,8)
                .padding(.bottom,5)
            HStack {
                Button(action: action){
                    HStack{
                        Text(getFieldText())
                            .foregroundColor(input.isEmpty ? ColorProvider.grey4 : ColorProvider.white)
                            .h2()
                        Spacer()
                        Image(systemName: image)
                            .font(.system(size: 18.0))
                            .foregroundColor(ColorProvider.white)
                            .padding(.trailing,10)
                        
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .inputField()
        }
    }
    
    private func getFieldText() -> String {
        if input.isEmpty {
            return hint
        }else{
            return input
        }
    }
}

struct TrenaClickableField_Previews: PreviewProvider {
    static var previews: some View {
        TrenaClickableField(label: "Email",input:"Oi",action: {})
    }
}
