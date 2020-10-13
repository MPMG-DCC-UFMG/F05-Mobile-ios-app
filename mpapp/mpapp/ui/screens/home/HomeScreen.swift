import SwiftUI

struct HomeScreen: View {
    
    @State private var navigate = HomeNavigation.home
    
    var body: some View {
        ZStack{
            self.containedView().transition(AnyTransition.opacity)
            .animation(.default)
        }
    }
    
    private func containedView() -> AnyView{
        switch navigate{
        case .publicWorkList:
            return AnyView(PublicWorkListScreen(onHomeClicked:{
                self.navigateTo(HomeNavigation.home)
            }))
        case .addPublicWork:
            return AnyView(PublicWorkAddScreen(onCancelClicked:{
                self.navigateTo(HomeNavigation.home)
            }))
        case .sync:
            return AnyView(SyncView(onBackPressed: {
                self.navigateTo(HomeNavigation.home)
            }))
        default:
            return AnyView(HomeView(navigate: $navigate))
        }
    }
    
    private func navigateTo(_ to: HomeNavigation){
        self.navigate = to
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
