import Foundation

class CityRemote: Decodable{
    var codigoIbge: String
    var name: String
    var longitude: Double
    var latitude: Double
    var uf: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case longitude
        case latitude
        case uf
        case codigoIbge = "codigo_ibge"
    }
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(CityRemote.self, from: jsonData)
        self.name = response.name
        self.longitude = response.longitude
        self.latitude = response.latitude
        self.codigoIbge = response.codigoIbge
        self.uf = response.uf
    }
    
    func toCityDB() -> City{
        let city =  City()
        city.codigoIbge = self.codigoIbge
        city.latitude = self.latitude
        city.longitude = self.longitude
        city.name = self.name
        city.uf = self.uf
        return city
    }
}
