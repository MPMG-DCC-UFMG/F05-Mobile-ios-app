import Foundation
import Gloss

class CityRemote: JSONDecodable{
    let codigoIbge: String?
    let name: String?
    let longitude: Double?
    let latitude: Double?
    let uf: String?
    
    required init?(json: JSON) {
        self.codigoIbge = "codigo_ibge" <~~ json
        self.name = "name" <~~ json
        self.longitude = "longitude" <~~ json
        self.latitude = "latitude" <~~ json
        self.uf = "uf" <~~ json
    }
    
    func toCityDB() -> City{
        let city =  City()
        city.codigoIbge = self.codigoIbge!
        city.latitude = self.latitude!
        city.longitude = self.longitude!
        city.name = self.name!
        city.uf = self.uf!
        return city
    }
}
