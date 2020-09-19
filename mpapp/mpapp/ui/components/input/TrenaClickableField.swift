import SwiftUI

struct TrenaClickableField: View {
    var label: String
    var input: String
    var image: String = "chevron.down"
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
                        Text(input)
                            .foregroundColor(ColorProvider.white)
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
}

struct TrenaClickableField_Previews: PreviewProvider {
    static var previews: some View {
        TrenaClickableField(label: "Email",input:"Oi",action: {})
    }
}
