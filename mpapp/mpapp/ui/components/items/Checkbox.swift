import SwiftUI

struct Checkbox: View {
    let text: String
    let image: String?
    @Binding var isOn: Bool
    
    var body: some View {
        Button(action: {
            self.isOn.toggle()
        }) {
            HStack(alignment: .top) {
                Rectangle()
                    .fill(isOn ? ColorProvider.greenTrena : Color.clear)
                    .cornerRadius(2)
                    .padding(2)
                    .overlay(
                        Rectangle().stroke(isOn ? ColorProvider.greenTrena : ColorProvider.grey4,lineWidth: 2)
                            .cornerRadius(2))
                    .frame(width: 18, height: 18)
                Text(text).h2(color:isOn ? ColorProvider.white : ColorProvider.grey4)
                Spacer()
                if(image != nil){
                    Image(image!).renderingMode(.original).padding(.horizontal,20)
                }
            }
            .contentShape(Rectangle())
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 15)
        .padding()
        .background(isOn ? ColorProvider.grey2 : ColorProvider.grey1)
        .cornerRadius(4)
    }
}

struct Checkbox_Previews: PreviewProvider {
    @State static var isOn:Bool = true
    @State static var isOff:Bool = false
    static var previews: some View {
        VStack{
            Checkbox(text: "Ordem alfabética", image: "sync_blue", isOn: $isOn)
            Checkbox(text: "Ordem alfabética", image: "check", isOn: $isOff)
        }
    }
}
