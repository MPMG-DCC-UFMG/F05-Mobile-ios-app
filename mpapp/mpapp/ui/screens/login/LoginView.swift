import SwiftUI
import Resolver

struct LoginView: View {
    
    @ObservedObject private var loginViewModel: LoginViewModel = Resolver.resolve()
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                Image("trena_white").padding(.top, 50.0)
                TrenaTextField(label: "Email", placeHolder: "Entre com seu email",input: $email).padding(.top,20)
                TrenaPasswordField(label: "Senha", placeHolder: "Sua senha",input: $password).padding(.top,12)
                
                TrenaButton(label: "Entrar") {
                    self.login()
                }.padding(.top,25)
                
                HStack{
                    Text("Não tem conta?").h3()
                    Button(action: login){
                        Text("Cadastre aqui").h3(color: ColorProvider.greenTrena)
                    }
                }.padding(.top,20)
                HStack{
                    TrenaDivider()
                    Text("se preferir")
                        .scaledFont(name: FontProvider.nunitoItalic, size: 14)
                    TrenaDivider()
                }.foregroundColor(Color.white).padding(.top,10)
                SignInButton(action: login,label: "Entre com Google", image: "google_logo",backgroundColor: ColorProvider.white, textColor: ColorProvider.grey2)
                SignInButton(action: login,label: "Entre com Facebook", image: "facebook_logo",backgroundColor: ColorProvider.blueFacebook, textColor: ColorProvider.white)
                    .padding(.top,10)
                SignInButton(action: login,label: "Entre com Twitter", image: "twitter_logo",backgroundColor: ColorProvider.blueTwitter, textColor: ColorProvider.white)
                    .padding(.top,10)
                Spacer()
            }.padding(.horizontal, 30)
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
    
    private func login(){
        self.loginViewModel.toggleLogin()
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
