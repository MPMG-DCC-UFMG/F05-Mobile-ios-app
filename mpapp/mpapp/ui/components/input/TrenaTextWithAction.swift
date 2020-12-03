import SwiftUI

struct TrenaTextWithAction: View {
    var placeHolder: String
    var input :String
    var action: () -> Void
    
    var body: some View {
        HStack{
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 18.0))
                .foregroundColor(ColorProvider.white)
                .padding(.trailing,5)
            ZStack(alignment: .leading){
                if input.isEmpty{
                    Text(placeHolder)
                }
                Text(input)
                    .lineLimit(2)
                    .foregroundColor(ColorProvider.white)
            }
            .h4()
            .padding(.trailing,8)
            Spacer()
            Button(action: action){
                Image("refresh").renderingMode(.original).padding(.horizontal,20)
            }
            .frame(minHeight: 0, maxHeight: .infinity)
            .background(ColorProvider.greenTrena)
        } .frame(height: 55.0)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.leading, 10)
            .background(ColorProvider.grey2)
            .cornerRadius(4)
        
    }
}

struct TrenaTextWithAction_Previews: PreviewProvider {
    static var previews: some View {
        TrenaTextWithAction(placeHolder: "Atualizar localização ...", input: "Oi",action:{})
    }
}
