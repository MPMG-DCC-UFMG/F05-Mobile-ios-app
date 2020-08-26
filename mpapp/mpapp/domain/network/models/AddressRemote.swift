import Foundation
import Gloss

class AddressRemote: JSONDecodable{
    let id: String?
    let street: String?
    let state: String?
    let city: String?
    let number: String?
    let neighborhood: String?
    let cep: String?
    let latitude: Double?
    let longitude: Double?
    let publicWorkId: String?
    
    required init?(json: JSON) {
        self.id = "id" <~~ json
        self.street = "street" <~~ json
        self.state = "state" <~~ json
        self.city = "city" <~~ json
        self.number = "number" <~~ json
        self.neighborhood = "neighborhood" <~~ json
        self.cep = "cep" <~~ json
        self.longitude = "longitude" <~~ json
        self.latitude = "latitude" <~~ json
        self.publicWorkId = "public_work_id" <~~ json
    }
    
    func toAddressDB() -> Address{
        let address =  Address()
        address.id = self.id!
        address.street = self.street!
        address.state = self.state!
        address.city = self.city!
        address.number = self.number!
        address.cep = self.cep!
        address.latitude = self.latitude!
        address.longitude = self.longitude!
        address.idPublicWork = self.publicWorkId!
        return address
    }
}
