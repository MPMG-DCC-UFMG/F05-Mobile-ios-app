import SwiftUI
import Resolver

struct HomeView: View {
    
    @ObservedObject private var loginViewModel: LoginViewModel = Resolver.resolve()
    @ObservedObject private var configurationViewModel: ConfigurationViewModel = Resolver.resolve()
    @Binding var navigate:HomeNavigation
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                HStack{
                    Image("trena_white").padding(.top, 50.0)
                    Spacer()
                }.padding(.leading,10)
                Text("Bem vindo ao TRENA, o aplicativo de fiscalização do Ministério Público de Minas Gerais").h2().padding(.top,40)
                    .padding(.leading,14)
                HomeButton(action: {
                    self.navigateTo(HomeNavigation.publicWorkList)
                }, label: "Lista de obras", image: "list")
                    .padding(.top,50)
                HomeButton(action: {
                    self.navigateTo(HomeNavigation.addPublicWork)
                }, label: "Adicionar nova obra", image: "plus")
                    .padding(.top,10)
                HomeButton(action: {}, label: "Enviar dados", image: "sync")
                    .padding(.top,10)
                HomeButton(action: logout, label: "Sair", image: "logout")
                    .padding(.top,10)
                Spacer()
            }.padding(.horizontal,20)
        }
    }
    
    private func logout(){
        loginViewModel.toggleLogin()
        configurationViewModel.resetWorkerStatus()
    }
    
    private func navigateTo(_ navigation: HomeNavigation){
        navigate = navigation
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var navigate = HomeNavigation.home
    static var previews: some View {
        HomeView(navigate: HomeView_Previews.$navigate)
    }
}
