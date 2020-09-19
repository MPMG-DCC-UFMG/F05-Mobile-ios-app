import SwiftUI

struct PublicWorkListScreen: View {
    @State var currentView: Tab = .Tab2
    var onHomeClicked: (() -> Void)?
    
    @State private var selectedPublicWork: PublicWork? = nil
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            if(selectedPublicWork != nil){
                CollectScreen(onBackPressed:{
                    self.onPublicWorkClicked(publicWork: nil)
                },publicWork: PublicWorkUI(selectedPublicWork!))
            }else{
                VStack(spacing: 0){
                    if self.currentView == .Tab2 {
                        PublicWorkListView(onPublicWorkClicked: self.onPublicWorkClicked)
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
    
    private func onPublicWorkClicked(publicWork: PublicWork?){
        self.selectedPublicWork = publicWork
    }
}

struct PublicWorkListScreen_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkListScreen()
    }
}
