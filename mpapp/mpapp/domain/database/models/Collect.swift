import Foundation
import RealmSwift

class Collect: Object,Identifiable{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var idUser = ""
    @objc dynamic var idPublicWork = ""
    @objc dynamic var date = Date().currentTimeMillis()
    @objc dynamic var isSent = false
    @objc dynamic var comments: String? = nil
    @objc dynamic var publicWorkStatus = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
