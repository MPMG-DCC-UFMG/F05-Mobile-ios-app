import SwiftUI

struct TrenaTabBar: View {
    @Binding var currentView: Tab
    let onChanged: ((_ tab: Tab) -> Void)?
    
    var body: some View {
        HStack {
            TabBarItem(currentView: self.$currentView, imageName: "home",selectedImageNamge: "home", label:"Home", tab: .Tab1,onChanged: self.onChanged)
            TabBarItem(currentView: self.$currentView, imageName: "list",selectedImageNamge: "list_selected", label:"Lista de Obras", tab: .Tab2,onChanged: self.onChanged)
            TabBarItem(currentView: self.$currentView, imageName: "filter",selectedImageNamge: "filter_selected", label:"Filtrar", tab: .Tab3,onChanged: self.onChanged)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(minHeight: 70)
        .background(ColorProvider.grey2)
    }
}

struct TrenaTabBar_Previews: PreviewProvider {
    @State static var currentView:Tab = .Tab1
    static var previews: some View {
        TrenaTabBar(currentView: $currentView, onChanged: nil)
    }
}
