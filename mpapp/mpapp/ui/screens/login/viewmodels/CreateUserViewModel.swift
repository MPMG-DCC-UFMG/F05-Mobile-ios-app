import Foundation
import PromiseKit

class CreateUserViewModel: BaseViewModel, ObservableObject {
    
    private let userRepository: UserRepository
    
    @Published var invalidCreationMessage: String? = nil
    
    init(userRepository: UserRepository){
        self.userRepository = userRepository
    }
    
    func registerUser(email: String, password: String){
        firstly{
            userRepository.createUser(userRemote: MPUserRemote(email: email, password: password))
        }.done{ response in
            if(response.success){
                self.navController.navigateBack()
                self.invalidCreationMessage = nil
            }else{
                self.invalidCreationMessage = response.error?.message
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
    
    func navigateBack(){
        self.navController.navigateBack()
    }
}
