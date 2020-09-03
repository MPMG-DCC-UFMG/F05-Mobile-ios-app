import SwiftUI

struct PublicWorkListScreen: View {
    @State var currentView: Tab = .Tab2
    var onHomeClicked: (() -> Void)?
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0){
                if self.currentView == .Tab2 {
                    PublicWorkListView()
                } else if self.currentView == .Tab3 {
                    PublicWorkFilterView()
                }
                TrenaTabBar(currentView: $currentView, onChanged: { tab in
                    if(tab == .Tab1){
                        self.onHomeClicked?()
                    }
                })
            }
        }
        
    }
}

struct PublicWorkListScreen_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkListScreen()
    }
}
