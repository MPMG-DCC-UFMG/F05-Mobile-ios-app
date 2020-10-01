import SwiftUI
import Resolver

struct CreateUserView: View {
    
    @ObservedObject private var loginViewModel: LoginViewModel = Resolver.resolve()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Image("trena_white").padding(.top, 20.0)
                Text("Cadastrar").h1().padding(.top,25)
                TrenaTextField(label: "Email", placeHolder: "Entre com seu email",input: $email).padding(.top,20)
                TrenaPasswordField(label: "Senha", placeHolder: "Sua senha",input: $password).padding(.top,12)
                TrenaPasswordField(label: "Confirmar senha", placeHolder: "Sua senha",input: $password2).padding(.top,12)
                Spacer()
                TrenaButton(label: "Cadastrar",action: handleRegisterClicked,enabled:self.formValid()).padding(.horizontal,20)
                TrenaButton(label: "Cancelar",style:.button3) {
                    handleCancelClicked()
                }.padding(.vertical,15)
                .padding(.horizontal,20)
                
            }.padding(.horizontal, 30)
        }
    }
    
    private func formValid() -> Bool{
        return password == password2 && loginViewModel.isValidEmail(email) && !password.isEmpty
    }
    
    private func handleRegisterClicked(){
        self.loginViewModel.registerUser(email: email, password: password)
    }
    
    private func handleCancelClicked(){
        self.loginViewModel.navigateLogin()
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
