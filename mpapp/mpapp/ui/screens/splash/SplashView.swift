import SwiftUI
import Resolver

struct SplashView: View {
    
    private var splashViewModel : SplashViewModel = Resolver.resolve()

    var body: some View {
        ZStack{
            Image("splash_background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            VStack{
                Image("trena_logo")
                    .padding(.top, 150.0)
                Spacer()
            }
        }.onAppear {
            self.splashViewModel.startCounting()
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
