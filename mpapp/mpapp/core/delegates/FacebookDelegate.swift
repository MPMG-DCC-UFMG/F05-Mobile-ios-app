import Foundation
import FBSDKLoginKit
import Resolver
import Firebase

class FacebookDelegate{
    private let loginManager = LoginManager()
    private var loginViewModel: LoginViewModel = Resolver.resolve()
    
    func tryLogin(){
        loginManager.logIn(permissions: [.publicProfile,.email], viewController: nil){loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success( _, _, let accessToken):
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
                self.loginViewModel.authFirebase(credential: credential)
            }
        }
    }
}
