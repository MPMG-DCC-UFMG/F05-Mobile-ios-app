import SwiftUI
import Resolver

struct LoginScreen: View {
    
    @ObservedObject private var loginViewModel: LoginViewModel = Resolver.resolve()
        
    var body: some View {
        VStack{
            self.containedView().transition(AnyTransition.opacity)
                .animation(.default)
        }
    }
    
    private func containedView() -> AnyView {
        switch loginViewModel.navigate {
        case .login:
            return AnyView(LoginView())
        case .loading:
            return AnyView(LoadingDataScreen())
        default:
            return AnyView(CreateUserView())
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
