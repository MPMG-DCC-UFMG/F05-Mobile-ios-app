import Foundation
import RealmSwift

class Collect: Object,Identifiable{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var idUser = ""
    @objc dynamic var idPublicWork = ""
    @objc dynamic var date = Date().currentTimeMillis()
    @objc dynamic var isSent = false
    @objc dynamic var comments: String? = nil
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func fromValues(id: String, idUser: String, idPublicWork: String,
                           date:Int64, isSent: Bool, comments: String?) -> Collect{
        let collect = Collect()
        collect.id = id
        collect.idUser = idUser
        collect.idPublicWork = idPublicWork
        collect.date = date
        collect.isSent = isSent
        collect.comments = comments
        return collect
    }
}
