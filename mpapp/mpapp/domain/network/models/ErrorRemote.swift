import Foundation

class ErrorRemote: Decodable{
    var statusCode: Int
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case message
    }
    
    init(_ jsonData: Data) {
        let error = try! JSONDecoder().decode(ErrorRemote.self, from: jsonData)
        self.statusCode = error.statusCode
        self.message = error.message
    }
}
