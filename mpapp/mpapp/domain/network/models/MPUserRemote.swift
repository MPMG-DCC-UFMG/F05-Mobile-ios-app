import Foundation

class MPUserRemote: Codable{
    var email: String
    var authentication : String
    var fullName : String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case authentication
        case email
    }
    
    init(email: String, password: String) {
        self.email = email
        self.authentication = password
        self.fullName = ""
    }
    
    init(jsonData: Data) {
        let user = try! JSONDecoder().decode(MPUserRemote.self, from: jsonData)
        self.email = user.email
        self.authentication = user.authentication
        self.fullName = user.fullName
    }
    
    func toParameter() -> Data {
        let jsonData = try! JSONEncoder().encode(self)
        return jsonData
    }
}
