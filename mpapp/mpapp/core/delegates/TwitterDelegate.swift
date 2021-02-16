import Foundation
import FirebaseAuth

class TwitterDelegate{
    
    private var loginViewModel: LoginViewModel
    
    init(_ loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
    }
    
    private static let provider = OAuthProvider(providerID: "twitter.com")
    
    func tryLogin(){
        TwitterDelegate.provider.getCredentialWith(nil) { credential, error in
            if error != nil {
                // Handle error.
            }
            if credential != nil {
                self.loginViewModel.authFirebase(credential: credential!)
            }
        }
    }
}
