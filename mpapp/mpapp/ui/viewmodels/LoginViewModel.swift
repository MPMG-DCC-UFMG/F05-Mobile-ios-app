import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var logged = false
    
    func login(){
        self.logged.toggle()
    }
}
