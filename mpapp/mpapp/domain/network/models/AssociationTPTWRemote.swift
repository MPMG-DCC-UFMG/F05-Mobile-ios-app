import Foundation

class AssociationTPTWRemote: Decodable{
    var typeWorkFlag: Int
    var typePhotoFlag: Int
    
    enum CodingKeys: String, CodingKey {
        case typePhotoFlag = "type_photo_flag"
        case typeWorkFlag = "type_work_flag"
    }
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(AssociationTPTWRemote.self, from: jsonData)
        self.typePhotoFlag = response.typePhotoFlag
        self.typeWorkFlag = response.typeWorkFlag
    }
    
    func toAssociationTPTWDB() -> AssociationTPTW{
        let associationTPTW =  AssociationTPTW()
        associationTPTW.typeWorkFlag = self.typeWorkFlag
        associationTPTW.typePhotoFlag = self.typePhotoFlag
        return associationTPTW
    }
}

