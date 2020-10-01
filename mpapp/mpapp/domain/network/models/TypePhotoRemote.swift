import Foundation

class TypePhotoRemote: Decodable{
    var name: String
    var flag: Int
    var comments: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case flag
        case comments
    }
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(TypePhotoRemote.self, from: jsonData)
        self.name = response.name
        self.flag = response.flag
        self.comments = response.comments
    }
    
    func toTypePhotoDB() -> TypePhoto{
        let typePhoto =  TypePhoto()
        typePhoto.flag = self.flag
        typePhoto.name = self.name
        typePhoto.comment = self.comments
        return typePhoto
    }
}
