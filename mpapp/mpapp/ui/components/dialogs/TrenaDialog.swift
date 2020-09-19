import SwiftUI

struct TrenaDialog: View {
    
    let title: String
    let message: String
    let negativeButtonText: String = "Cancelar"
    let positiveButtonText: String = "Confirmar"
    
    var onPositiveClicked: (() -> Void)?
    var onCloseClicked: (() -> Void)?
    var onNegativeClicked: (() -> Void)?
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text(title).h2()
                        .padding(.leading,15)
                    Spacer()
                    ImageButton(onClick: self.onCloseClicked, width: 20, image: "close", backgroundColor: ColorProvider.grey5)
                        .padding(.trailing,10)
                }
                .frame(maxWidth: .infinity,maxHeight: 40)
                .background(ColorProvider.grey3)
                VStack{
                    Text(message).h3()
                        .padding()
                    HStack{
                        Spacer()
                        Button(action: {
                            self.onNegativeClicked?()
                            self.onCloseClicked?()
                        }){
                            Text(negativeButtonText).h3()
                        }.smallButtonStyle(style:.smallButton1)
                        Button(action: {self.onPositiveClicked?()}){
                            Text(positiveButtonText).h3(color: ColorProvider.red)
                        }.smallButtonStyle(style:.smallButton1)
                    }.padding(.vertical,10)
                    .padding(.trailing,5)
                }
            }.frame(maxWidth:300)
            .background(ColorProvider.grey1)
            .cornerRadius(20, corners: [.topLeft, .topRight,.bottomLeft,.bottomRight])
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.3))
    }
}

struct TrenaDialog_Previews: PreviewProvider {
    static var previews: some View {
        TrenaDialog( title: "Deletar Coleta",message: "A coleta não podera ser restaurada")
    }
}
