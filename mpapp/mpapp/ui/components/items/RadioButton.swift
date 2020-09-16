import SwiftUI

struct RadioButton: View {
    let text: String
    @Binding var isOn: Bool
    
    var body: some View {
        Button(action: {
            self.isOn.toggle()
        }) {
            HStack(alignment: .top) {
                Circle()
                    .fill(isOn ? ColorProvider.greenTrena : Color.clear)
                    .padding(2)
                    .overlay(
                        Circle().stroke(isOn ? ColorProvider.greenTrena : ColorProvider.grey4,lineWidth: 2))
                    .frame(width: 18, height: 18)
                Text(text).h2(color:isOn ? ColorProvider.white : ColorProvider.grey4)
                Spacer()
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

struct RadioButton_Previews: PreviewProvider {
    @State static var isOn:Bool = true
    @State  static var isOff:Bool = false
    static var previews: some View {
        VStack{
            RadioButton(text: "Ordem alfabética", isOn: $isOn)
            RadioButton(text: "Ordem alfabética", isOn: $isOff)
        }
        
    }
}
