import Foundation

class EntityVersion: Decodable{
    var version: Int
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(EntityVersion.self, from: jsonData)
        self.version = response.version
    }
    
    init() {
        version = -1
    }
}
