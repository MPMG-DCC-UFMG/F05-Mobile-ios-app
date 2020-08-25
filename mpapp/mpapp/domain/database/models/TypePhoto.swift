import Foundation
import RealmSwift

class TypePhoto: Object,Identifiable{
    
    @objc dynamic var flag = 0
    @objc dynamic var name = ""
    @objc dynamic var comment: String? = nil
    
    override static func primaryKey() -> String? {
        return "flag"
    }
    
    static func fromValues(flag: Int,name: String, comment:String?) -> TypePhoto{
        let typePhoto = TypePhoto()
        typePhoto.flag = flag
        typePhoto.name = name
        typePhoto.comment = comment
        return typePhoto
    }
}
