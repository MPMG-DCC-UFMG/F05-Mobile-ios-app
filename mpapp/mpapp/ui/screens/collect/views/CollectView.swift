import SwiftUI

struct CollectView: View {
    
    var publicWork: PublicWorkUI
    var onBackPressed: (() -> Void)?
    var onEditClicked: (() -> Void)?
    var onDeleteClicked: (() -> Void)?
    var onAddClicked: (() -> Void)?
    var onCommentClicked: (() -> Void)?
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Button(action:{
                        self.onBackPressed?()
                    }){
                        Image(systemName: "arrow.left")
                        .font(.system(size: 28.0))
                        .h1()
                    }.padding(.horizontal,15)
                    Spacer()
                    Text(self.publicWork.name)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing,30)
                        .h2()
                    Spacer()
                }
                .padding(.bottom,15)
                HStack{
                    Text(self.publicWork.formatedAddress())
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.trailing,40)
                    .h4()
                    Button(action: {self.onEditClicked?()}){
                        Image(systemName: "pencil")
                        .font(.system(size: 15.0))
                        Text("Editar").h3(color: ColorProvider.greenTrena)
                    }.smallButtonStyle(style:.smallButton1)
                }
                Spacer()
            }.padding(.horizontal,10)
            FloatingMenu(onDeleteClicked: self.onDeleteClicked, onAddClicked: self.onAddClicked, onCommentClicked: self.onCommentClicked)
        }
    }
}

struct CollectView_Previews: PreviewProvider {
    static var previews: some View {
        CollectView(publicWork: PublicWorkUI(PublicWork()))
    }
}
