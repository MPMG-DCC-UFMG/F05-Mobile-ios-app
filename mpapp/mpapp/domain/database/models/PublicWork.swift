import Foundation
import RealmSwift

class PublicWork: Object,Identifiable{
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var idCollect: String? = nil
    @objc dynamic var typeWorkFlag = 1
    @objc dynamic var toSend = false
    @objc dynamic var userStatusFlag = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func fromValues(id: String,name: String, idCollect:String?, typeWorkFlag:Int, toSend:Bool, userStatusFlag:Int) -> PublicWork{
        let publicWork = PublicWork()
        publicWork.id = id
        publicWork.name = name
        publicWork.idCollect = idCollect
        publicWork.typeWorkFlag = typeWorkFlag
        publicWork.toSend = toSend
        publicWork.userStatusFlag = userStatusFlag
        return publicWork
    }
}
