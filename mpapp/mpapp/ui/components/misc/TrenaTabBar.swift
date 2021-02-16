import SwiftUI

struct TrenaTabBar: View {
    @Binding var currentView: Tab
    let onChanged: ((_ tab: Tab) -> Void)?
    
    var body: some View {
        HStack {
            TabBarItem(currentView: self.$currentView, imageName: "house.fill", label:"Home", tab: .Tab1,onChanged: self.onChanged)
            TabBarItem(currentView: self.$currentView, imageName: "list.bullet", label:"Lista", tab: .Tab2,onChanged: self.onChanged)
            TabBarItem(currentView: self.$currentView, imageName: "slider.horizontal.3", label:"Filtrar", tab: .Tab3,onChanged: self.onChanged)
            TabBarItem(currentView: self.$currentView, imageName: "map.fill", label:"Mapa", tab: .Tab4, onChanged: self.onChanged)
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
