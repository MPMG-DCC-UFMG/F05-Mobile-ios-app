import SwiftUI

struct CommentBottom: View {
    
    @Binding var closed: Bool
    @State var comment: String
    var onConfirmClicked: ((_ comment: String) -> Void)? = nil
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: closeDialog){
                    Text("Cancelar").h2(color: ColorProvider.red)
                }.padding()
                Spacer()
                Button(action: confirmationAction){
                    Text("Confirmar").h2(color: ColorProvider.greenTrena)
                }.padding()
            }
            .background(ColorProvider.grey2)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .padding(.bottom,-10)
            TextEditor(text: $comment)
                .h3()
                .lineLimit(6)
                .background(ColorProvider.darkBackground)
                .frame(minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 250, alignment: .leading)
                .onAppear(perform: {
                    UITextView.appearance().backgroundColor = .clear
                })
        }
        .background(Color.gray.opacity(0.3))
    }
    
    func closeDialog(){
        self.closed.toggle()
    }
    
    func confirmationAction(){
        self.onConfirmClicked?(self.comment)
        closeDialog()
    }
}

struct CommentBottom_Previews: PreviewProvider {
    @State static var closed = false
    static var previews: some View {
        CommentBottom(closed: $closed,comment:  "Teste de muitas linhas nessa bagaça que vai funcionar porque eu sou foda e eu falei que vai funcionar sim")
    }
}
