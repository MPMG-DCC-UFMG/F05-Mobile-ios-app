import Foundation
import PromiseKit
import Firebase
import GoogleSignIn
import SwiftUI

class LoginViewModel:  BaseViewModel,ObservableObject {
    
    @Published var navigate = LoginNavigation.login
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository){
        self.userRepository = userRepository
    }
    
    func navigateRegistering(){
        self.navController.navigateTo(AnyView(CreateUserView()))
    }
    
    func navigateLoading(){
        self.navController.navigateTo(AnyView(LoadingDataView()))
    }
    
    func checkLoggedUser(){
        if Auth.auth().currentUser != nil {
            navigateLoading()
        }
    }
    
    func navigateLogin(){
        navigate = .login
    }
    
    func logout(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        navigateLogin()
    }
    
    func authFirebase(credential: AuthCredential){
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                let authError = error as NSError
                print(authError)
                return
            }
            
            self.navigateLoading()
        }
    }
    
    func loginMP(email: String, password: String){
        firstly{
            userRepository.login(email: email, password: password)
        }.done{response in
            if(response.token != "error"){
                self.navigateLoading()
            }
        }.catch{error in
            print(error)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
