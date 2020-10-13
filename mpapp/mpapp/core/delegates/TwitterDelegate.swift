import Foundation
import Resolver
import FirebaseAuth

class TwitterDelegate{
    private var loginViewModel: LoginViewModel = Resolver.resolve()
    
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
