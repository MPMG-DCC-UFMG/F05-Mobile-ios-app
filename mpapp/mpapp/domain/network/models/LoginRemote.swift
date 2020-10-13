import Foundation

class LoginRemote: Codable{
    var username: String
    var password : String
    
    init(email: String, password: String) {
        self.username = email
        self.password = password
    }
    
    init(jsonData: Data) {
        let user = try! JSONDecoder().decode(LoginRemote.self, from: jsonData)
        self.username = user.username
        self.password = user.password
    }
    
    func toParameter() -> Data {
        let jsonData = try! JSONEncoder().encode(self)
        return jsonData
    }
}
