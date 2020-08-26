import Foundation
import RealmSwift

class City: Object,Identifiable{
    
    @objc dynamic var codigoIbge = ""
    @objc dynamic var name = ""
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    @objc dynamic var uf = ""
    
    override static func primaryKey() -> String? {
        return "codigoIbge"
    }
    
    static func fromValues(codigoIbge: String,name: String, latitude:Double, longitude:Double,uf:String) -> City{
        let city = City()
        city.codigoIbge = codigoIbge
        city.name = name
        city.latitude = latitude
        city.longitude = longitude
        city.uf = uf
        return city
    }
}
