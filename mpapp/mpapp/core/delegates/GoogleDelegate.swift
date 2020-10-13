import Foundation
import GoogleSignIn
import Firebase
import Resolver

class GoogleDelegate: NSObject, GIDSignInDelegate, ObservableObject{
    
    private var loginViewModel: LoginViewModel = Resolver.resolve()
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        self.loginViewModel.authFirebase(credential: credential)
    }
}
