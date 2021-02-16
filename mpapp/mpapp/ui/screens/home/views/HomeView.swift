import SwiftUI
import Resolver

struct HomeView: View {
    
    private var homeViewModel: HomeViewModel = Resolver.resolve()
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                HStack{
                    Image("trena_white").padding(.top, 50.0)
                    Spacer()
                }.padding(.leading,10)
                Text("Bem-vindo(a) ao TRENA, o aplicativo de fiscalização do Ministério Público de Minas Gerais").h2().padding(.top,40)
                    .padding(.leading,14)
                HomeButton(action: toPublicWorkList, label: "Lista de obras", image: "list")
                    .padding(.top,50)
                HomeButton(action: toAddPublicWork, label: "Adicionar nova obra", image: "plus")
                    .padding(.top,10)
                HomeButton(action: toSyncView, label: "Enviar dados", image: "sync", badgeCount: homeViewModel.countObjectsToSync())
                    .padding(.top,10)
                HomeButton(action: logout, label: "Sair", image: "logout")
                    .padding(.top,10)
                Spacer()
            }.padding(.horizontal,20)
        }
    }
    
    private func logout(){
        homeViewModel.logout()
    }
    
    private func toPublicWorkList(){
        homeViewModel.navigateToPublicWorkList()
    }
    
    private func toSyncView(){
        homeViewModel.navigateToSyncView()
    }
    
    private func toAddPublicWork(){
        homeViewModel.navigateAddPublicWork()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
