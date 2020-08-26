import Foundation
import RealmSwift

class AssociationTPTW: Object,Identifiable{
    @objc dynamic var typePhotoFlag = 0
    @objc dynamic var typeWorkFlag = 0
    
    static func fromValues(typePhotoFlag: Int,typeWorkFlag: Int) -> AssociationTPTW{
           let association = AssociationTPTW()
           association.typePhotoFlag = typePhotoFlag
           association.typeWorkFlag = typeWorkFlag
           return association
       }
}
