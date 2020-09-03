import SwiftUI

struct TabBarItem: View {
    @Binding var currentView: Tab
    let imageName: String
    let selectedImageNamge: String
    let label: String
    let tab: Tab
    let onChanged: ((_ tab: Tab) -> Void)?
    
    var body: some View {
        VStack(spacing:0){
            Image(self.currentView == tab ? selectedImageNamge : imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(5)
            .frame(width: 40, height: 40, alignment: .center)
            .cornerRadius(6)
            Text(label).h5(color: self.currentView == tab ? ColorProvider.greenTrena : ColorProvider.grey4)
        }.frame(width: 100, height: 50)
        .onTapGesture {
            self.onChanged?(self.tab)
            self.currentView = self.tab
        }
    }
}

struct TabBarItem_Previews: PreviewProvider {
    @State static var currentView:Tab = .Tab1
    static var previews: some View {
        TabBarItem(currentView: self.$currentView, imageName: "list",selectedImageNamge: "list_selected", label:"Lista", tab: .Tab1, onChanged: nil)
    }
}

enum Tab {
    case Tab1
    case Tab2
    case Tab3
}
