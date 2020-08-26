import SwiftUI

struct SplashView: View {
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
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
