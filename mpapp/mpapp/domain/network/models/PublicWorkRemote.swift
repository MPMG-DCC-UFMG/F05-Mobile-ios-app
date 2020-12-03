import Foundation

class PublicWorkRemote: Codable{
    var id: String
    var name: String?
    var typeWorkFlag: Int?
    var address: AddressRemote?
    var operation: Int?
    var userStatus: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case typeWorkFlag = "type_work_flag"
        case address
        case operation
        case userStatus = "user_status"
    }
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(PublicWorkRemote.self, from: jsonData)
        self.id = response.id
        self.name = response.name
        self.typeWorkFlag = response.typeWorkFlag
        self.address = response.address
        self.operation = response.operation
        self.userStatus = response.userStatus
    }
    
    init(_ publicWork: PublicWork){
        self.id = publicWork.id
        self.name = publicWork.name
        self.typeWorkFlag = publicWork.typeWorkFlag
        self.address = AddressRemote(publicWork.address!)
        self.userStatus = publicWork.userStatusFlag
    }
    
    func toPublicWorkDB() -> PublicWork{
        let publicWork =  PublicWork()
        publicWork.id = self.id
        publicWork.name = self.name  ?? ""
        publicWork.typeWorkFlag = self.typeWorkFlag  ?? -1
        publicWork.userStatusFlag = self.userStatus
        publicWork.toSend = false
        if(self.address != nil){
            publicWork.idAddress = self.address!.id
            publicWork.address = self.address!.toAddressDB()
            publicWork.lat = self.address!.latitude
            publicWork.lng = self.address!.longitude
        }
        return publicWork
    }
    
    func toParameter() -> Data {
        let jsonData = try! JSONEncoder().encode(self)
        return jsonData
    }
}
