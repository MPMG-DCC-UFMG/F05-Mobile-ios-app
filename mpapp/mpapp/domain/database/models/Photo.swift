import Foundation
import RealmSwift

class Photo: Object,Identifiable{
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var idCollect = ""
    @objc dynamic var filepath: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var isSent = false
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    @objc dynamic var timestamp = Date().currentTimeMillis()
    @objc dynamic var comment: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func fromValues(id: String, idCollect: String, filepath: String,
                           type:String, isSent: Bool, latitude: Double,
                           longitude: Double, timestamp: Int64,comment: String?) -> Photo{
        let photo = Photo()
        photo.id = id
        photo.idCollect = idCollect
        photo.filepath = filepath
        photo.type = type
        photo.isSent = isSent
        photo.latitude = latitude
        photo.longitude = longitude
        photo.timestamp = timestamp
        photo.comment = comment
        return photo
    }
}
