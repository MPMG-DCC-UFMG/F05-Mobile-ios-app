import SwiftUI

struct MainScreen: View {
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                LoginScreen()
            } else {
                SplashView()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
