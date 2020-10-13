import Foundation

class TokenRemote: Decodable{
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
    }
    
    init(_ jsonData: Data) {
        do {
            let response = try JSONDecoder().decode(TokenRemote.self, from: jsonData)
            self.token = response.token
        } catch{
            self.token = "error"
        }
    }
}
