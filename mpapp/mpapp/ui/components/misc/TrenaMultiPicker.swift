import SwiftUI

struct TrenaMultiPicker: View {
    var options: [String]
    @Binding var closed: Bool
    @State var selectedOptions: Array<Bool>
    var onOptionChanged: ((_ value: Int) -> Void)? = nil
    var onConfirmClicked: ((_ selected: Set<Int>) -> Void)? = nil
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Button(action: closePicker){
                    Text("Cancelar").h2(color: ColorProvider.red)
                }.padding()
                Spacer()
                Button(action: confirmationAction){
                    Text("Confirmar").h2(color: ColorProvider.greenTrena)
                }.padding()
            }.background(ColorProvider.darkBackground)
            ScrollView(.vertical){
                VStack{
                    ForEach(0 ..< options.count) { index in
                        Checkbox(text: self.options[index], image: nil, isOn: self.$selectedOptions[index]).padding(.horizontal,10)
                    }
                }
                .background(ColorProvider.darkBackground)
                .padding(.bottom,20)
            }
            .background(ColorProvider.darkBackground)
               
        }
        .background(Color.gray.opacity(0.3))
    }
    
    func closePicker(){
        self.closed.toggle()
    }
    
    func confirmationAction(){
        var selectedIndexes = Set<Int>()
        selectedOptions.enumerated().forEach({ index,item in
            if(item){
                selectedIndexes.insert(index)
            }
        })
        self.onConfirmClicked?(selectedIndexes)
        closePicker()
    }
}

struct TrenaMultiPicker_Previews: PreviewProvider {
    @State static var closed = false
    static var previews: some View {
        TrenaMultiPicker(options: ["o1","o2","Escola","teste","grande","mais"], closed: $closed, selectedOptions: [false,false,true,false,true,false])
    }
}
