import SwiftUI

struct FloatingMenu: View {
    
    var onDeleteClicked: (() -> Void)?
    var onAddClicked: (() -> Void)?
    var onCommentClicked: (() -> Void)?
    @State private var showMenu: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            HStack(){
                Spacer()
                if(showMenu){
                    FloatingButton(onClick: {
                        self.onDeleteClicked?()
                        showMenu.toggle()
                    }, width: 40,image:"trash_can_red",backgroundColor: ColorProvider.grey2)
                    
                    FloatingButton(onClick: {
                        self.onAddClicked?()
                        showMenu.toggle()
                    }, width: 40,image:"camera_green",backgroundColor: ColorProvider.grey2)
                    
                    FloatingButton(onClick: {
                        self.onCommentClicked?()
                        showMenu.toggle()
                    }, width: 40,image:"comment_green",backgroundColor: ColorProvider.grey2)
                }
                
                FloatingButton(onClick: {self.showMenu.toggle()}, width: 60,image:getMenuImage(),backgroundColor: ColorProvider.greenTrena)
            }.padding(.bottom,5)
            .padding(.trailing,5)
        }
    }
    
    private func getMenuImage() -> String{
        if(showMenu) {
            return "close"
        } else {
            return "plus_black"
        }
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}
