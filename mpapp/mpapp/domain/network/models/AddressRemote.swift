import Foundation

class AddressRemote: Codable{
    var id: String
    var street: String
    var state: String
    var city: String
    var number: String
    var neighborhood: String
    var cep: String
    var latitude: Double
    var longitude: Double
    var publicWorkId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case street
        case state
        case city
        case number
        case neighborhood
        case cep
        case latitude
        case longitude
        case publicWorkId = "public_work_id"
    }
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(AddressRemote.self, from: jsonData)
        self.id = response.id
        self.street = response.street
        self.state = response.state
        self.city = response.city
        self.number = response.number
        self.neighborhood = response.neighborhood
        self.cep = response.cep
        self.latitude = response.latitude
        self.longitude = response.longitude
        self.publicWorkId = response.publicWorkId
    }
    
    init(_ address: Address){
        self.id = address.id
        self.street = address.street
        self.state = address.state
        self.city = address.city
        self.number = address.number
        self.neighborhood = address.neighborhood
        self.cep = address.cep
        self.latitude = address.latitude
        self.longitude = address.longitude
        self.publicWorkId = address.idPublicWork
    }
    
    func toAddressDB() -> Address{
        let address =  Address()
        address.id = self.id
        address.street = self.street
        address.state = self.state
        address.city = self.city
        address.number = self.number
        address.cep = self.cep
        address.neighborhood = self.neighborhood
        address.latitude = self.latitude
        address.longitude = self.longitude
        address.idPublicWork = self.publicWorkId
        return address
    }
    
    func toParameter() -> Data {
        let jsonData = try! JSONEncoder().encode(self)
        return jsonData
    }
}
