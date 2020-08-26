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
    
    static func fromValues(id: String,idPublicWork: String,street: String,
                           neighborhood: String,number: String,latitude: Double,
                           longitude: Double, city: String, state: String, cep: String) -> Address{
        let address = Address()
        address.id = id
        address.idPublicWork = idPublicWork
        address.street = street
        address.neighborhood = neighborhood
        address.number = number
        address.latitude = latitude
        address.longitude = longitude
        address.city = city
        address.state = state
        address.cep = cep
        return address
    }
}
