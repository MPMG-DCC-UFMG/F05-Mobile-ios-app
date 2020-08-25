import Foundation
import Gloss

class AssociationTPTWRemote: JSONDecodable{
    let typeWorkFlag: Int?
    let typePhotoFlag: Int?
    
    required init?(json: JSON) {
        self.typeWorkFlag = "type_work_flag" <~~ json
        self.typePhotoFlag = "type_photo_flag" <~~ json
    }
    
    func toAssociationTPTWDB() -> AssociationTPTW{
        let associationTPTW =  AssociationTPTW()
        associationTPTW.typeWorkFlag = self.typeWorkFlag!
        associationTPTW.typePhotoFlag = self.typePhotoFlag!
        return associationTPTW
    }
}

