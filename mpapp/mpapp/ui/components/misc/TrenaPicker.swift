import SwiftUI

struct TrenaPicker: View {
    
    var options: [String]
    @Binding var closed: Bool
    @State var selectedOption: Int
    var onOptionChanged: ((_ value: Int) -> Void)? = nil
    var onConfirmClicked: ((_ value: Int) -> Void)? = nil
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: closePicker){
                    Text("Cancelar").h2(color: ColorProvider.red)
                }.padding()
                Spacer()
                Button(action: confirmationAction){
                    Text("Confirmar").h2(color: ColorProvider.greenTrena)
                }.padding()
            }.cornerRadius(25)
                .background(ColorProvider.darkBackground)
                .padding(.bottom,-10)
            Picker("", selection: $selectedOption){
                ForEach(0 ..< options.count) { index in
                    Text(self.options[index]).h2().tag(index)
                }
            }.onReceive([self.selectedOption].publisher.first()) { (value) in
                self.optionChanged()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .labelsHidden()
            .background(ColorProvider.darkBackground)
        }
        .background(Color.gray.opacity(0.3))
    }
    
    func optionChanged(){
        self.onOptionChanged?(self.selectedOption)
    }
    
    func closePicker(){
        self.closed.toggle()
    }
    
    func confirmationAction(){
        self.onConfirmClicked?(self.selectedOption)
        closePicker()
    }
}

struct TrenaPicker_Previews: PreviewProvider {
    @State static var closed = false
    static var previews: some View {
        TrenaPicker(options: ["o1","o2","Escola"], closed: $closed, selectedOption: 1)
    }
}
