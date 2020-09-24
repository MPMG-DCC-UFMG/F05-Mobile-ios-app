import SwiftUI

struct TrenaPicker: View {
    
    var options: [String]
    @Binding var closed: Bool
    @State var selectedOption: Int
    var negativeText: String = "Cancelar"
    var positiveText: String = "Confirmar"
    var onOptionChanged: ((_ value: Int) -> Void)? = nil
    var onConfirmClicked: ((_ value: Int) -> Void)? = nil
    var onNegativeClicked: ( () -> Void)?
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: negativeAction){
                    Text(negativeText).h2(color: ColorProvider.red)
                }.padding()
                Spacer()
                Button(action: confirmationAction){
                    Text(positiveText).h2(color: ColorProvider.greenTrena)
                }.padding()
            }.background(ColorProvider.grey2)
            .cornerRadius(20, corners: [.topLeft, .topRight])
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
    
    func negativeAction(){
        self.onNegativeClicked?()
        closePicker()
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
