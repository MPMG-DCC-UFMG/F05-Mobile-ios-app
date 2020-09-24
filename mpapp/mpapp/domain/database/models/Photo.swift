import Foundation
import RealmSwift

class Photo: Object,Identifiable{
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var idCollect = ""
    @objc dynamic var fileName: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var isSent = false
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    @objc dynamic var timestamp = Date().currentTimeMillis()
    @objc dynamic var comment: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }

}
