import SwiftUI
import Resolver

struct PublicWorkListScreen: View {
    @State var currentView: Tab = .Tab2
    
    var publicWorkViewModel: PublicWorkViewModel = Resolver.resolve()
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0){
                if self.currentView == .Tab2 {
                    PublicWorkListView(publicWorkViewModel: publicWorkViewModel)
                } else if self.currentView == .Tab3 {
                    PublicWorkFilterView(publicWorkViewModel:publicWorkViewModel)
                } else if self.currentView == .Tab4 {
                    PublicWorkMapListView(publicWorkViewModel: publicWorkViewModel)
                }
                TrenaTabBar(currentView: $currentView, onChanged: { tab in
                    if(tab == .Tab1){
                        navigateBack()
                    }
                })
            }
        }
        
    }
    
    private func navigateBack(){
        self.publicWorkViewModel.navigateBack()
    }
}

struct PublicWorkListScreen_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkListScreen()
    }
}
