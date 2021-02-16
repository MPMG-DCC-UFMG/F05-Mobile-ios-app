import Foundation
import SwiftUI

class SplashViewModel: BaseViewModel {

    func startCounting(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.navController.replaceTop(AnyView(LoginView()))
        }
    }
}
