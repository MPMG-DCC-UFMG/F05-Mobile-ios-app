import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                Image("trena_white").padding(.top, 50.0)
                TrenaTextField(label: "Email", placeHolder: "Entre com seu email").padding(.top,20)
                TrenaPasswordField(label: "Senha", placeHolder: "Sua senha").padding(.top,12)
                
                TrenaButton(label: "Entrar") {
                    print("Clicado")
                }.padding(.top,25)
                
                HStack{
                    Text("Não tem conta?").h3()
                    Button(action: {}){
                        Text("Cadastre aqui").h3(color: ColorProvider.greenTrena)
                    }
                }.padding(.top,20)
                HStack{
                    TrenaDivider()
                    Text("se preferir")
                    .scaledFont(name: FontProvider.nunitoItalic, size: 14)
                    TrenaDivider()
                }.foregroundColor(Color.white).padding(.top,10)
                SignInButton(action: {},label: "Entre com Google", image: "google_logo",backgroundColor: ColorProvider.white, textColor: ColorProvider.grey2)
                SignInButton(action: {},label: "Entre com Facebook", image: "facebook_logo",backgroundColor: ColorProvider.blueFacebook, textColor: ColorProvider.white)
                .padding(.top,10)
                SignInButton(action: {},label: "Entre com Twitter", image: "twitter_logo",backgroundColor: ColorProvider.blueTwitter, textColor: ColorProvider.white)
                .padding(.top,10)
                Spacer()
            }.padding(.horizontal, 30)
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
