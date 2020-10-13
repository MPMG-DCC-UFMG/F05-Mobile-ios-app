import Foundation

class ResponseRemote : Decodable{
    var success: Bool
    var error: ErrorRemote?
    
    enum CodingKeys: String, CodingKey {
        case success
        case error
    }
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(ResponseRemote.self, from: jsonData)
        self.success = response.success
        self.error = response.error
    }
}


