import Foundation
import RealmSwift

class Address: Object,Identifiable {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var idPublicWork = ""
    @objc dynamic var street = ""
    @objc dynamic var neighborhood = ""
    @objc dynamic var number = ""
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    @objc dynamic var city = ""
    @objc dynamic var state = "MG"
    @objc dynamic var cep = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func isLocationValid() -> Bool{
        return latitude != 0.0 && longitude != 0.0
    }
    
}
