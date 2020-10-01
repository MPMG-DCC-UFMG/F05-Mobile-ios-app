import Foundation
import PromiseKit

class LoginViewModel: ObservableObject {
    
    @Published var navigate = LoginNavigation.login
    
    private let userRepository: IUserRepository
    
    init(userRepository: IUserRepository){
        self.userRepository = userRepository
    }
    
    func toggleLogin(){
        navigate = .loading
    }
    
    func navigateRegistering(){
        navigate = .register
    }
    
    func navigateLogin(){
        navigate = .login
    }
    
    func registerUser(email: String, password: String){
        firstly{
            userRepository.createUser(userRemote: MPUserRemote(email: email, password: password))
        }.done{ response in
            if(response.success){
                self.navigate = .login
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
