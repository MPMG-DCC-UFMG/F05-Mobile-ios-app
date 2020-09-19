import Foundation

class PublicWorkUI: ObservableObject{
    
    private var publicWork: PublicWork
    private var address : Address
    
    @Published var name: String = ""
    @Published var cep: String = ""
    @Published var number: String = ""
    @Published var street: String = ""
    @Published var neighborhood: String = ""
    @Published var city: String = ""
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    var idCollect: String? = nil
    var typeWorkFlag = 0
    var toSend: Bool = false
    
    func isPublicWorkValid() -> Bool{
        return !name.isEmpty
    }
    
    func isLocationValid() -> Bool{
        return latitude != 0.0 && longitude != 0.0
    }
    
    func formatedAddress() -> String{
        return "\(street), \(number) - \(neighborhood) , \(city) - \(cep)"
    }
    
    func getId() -> String{
        return publicWork.id
    }
    
    func updateAddress(_ address: Address){
        self.cep = address.cep
        self.number = address.number
        self.street = address.street
        self.neighborhood = address.neighborhood
        self.city = address.city
        self.latitude = address.latitude
        self.longitude = address.longitude
    }
    
    init(_ publicWork: PublicWork) {
        self.publicWork = publicWork
        self.typeWorkFlag = publicWork.typeWorkFlag
        self.idCollect = publicWork.idCollect
        self.toSend = publicWork.toSend
        self.address = publicWork.address ?? Address()
        self.name = publicWork.name
        self.cep = address.cep
        self.number = address.number
        self.street = address.street
        self.neighborhood = address.neighborhood
        self.city = address.city
        self.latitude = address.latitude
        self.longitude = address.longitude
    }
    
    func toDbModel() -> PublicWork{
        publicWork.name = self.name
        publicWork.address = address
        publicWork.idAddress = address.id
        publicWork.typeWorkFlag = self.typeWorkFlag
        publicWork.idCollect = self.idCollect
        publicWork.toSend = true
        address.idPublicWork = publicWork.id
        address.cep = self.cep
        address.city = self.city
        address.latitude = self.latitude
        address.longitude = self.longitude
        address.neighborhood = self.neighborhood
        address.number = self.number
        address.street = self.street
        return publicWork
    }
    
    func getPublicWork() -> PublicWork{
        return self.publicWork
    }
}
