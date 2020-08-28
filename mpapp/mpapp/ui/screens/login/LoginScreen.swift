import SwiftUI
import Resolver

struct LoginScreen: View {
    
    @ObservedObject private var loginViewModel: LoginViewModel = Resolver.resolve()
        
    var body: some View {
        VStack{
            if loginViewModel.logged{
                LoadingDataScreen()
                    .transition(AnyTransition.opacity)
                    .animation(.default)
            }else{
                LoginView()
            }
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
