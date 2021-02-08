import Foundation
import FBSDKLoginKit
import Firebase

class FacebookDelegate{
    private let loginManager = LoginManager()
    private var loginViewModel: LoginViewModel
    
    init(_ loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
    }
    
    func tryLogin(){
        loginManager.logIn(permissions: [.publicProfile,.email], viewController: nil){loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success( _, _, let accessToken):
                guard let token = accessToken?.tokenString else{
                    return
                }
                let credential = FacebookAuthProvider.credential(withAccessToken: token)
                self.loginViewModel.authFirebase(credential: credential)
            }
        }
    }
}
