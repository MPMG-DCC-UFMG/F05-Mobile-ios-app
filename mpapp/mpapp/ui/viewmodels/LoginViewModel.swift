import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var logged = false
    
    func toggleLogin(){
        self.logged.toggle()
    }
}
