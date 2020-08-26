import Foundation
import Gloss

class TypePhotoRemote: JSONDecodable{
    let name: String?
    let flag: Int?
    let comments: String?
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.flag = "flag" <~~ json
        self.comments = "description" <~~ json
    }
    
    func toTypePhotoDB() -> TypePhoto{
        let typePhoto =  TypePhoto()
        typePhoto.flag = self.flag!
        typePhoto.name = self.name!
        typePhoto.comment = self.comments
        return typePhoto
    }
}
