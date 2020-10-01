import Foundation

class PublicWorkRemote: Decodable{
    var id: String
    var name: String
    var typeWorkFlag: Int
    var address: AddressRemote
    var operation: Int
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
    
    func toPublicWorkDB() -> PublicWork{
        let publicWork =  PublicWork()
        publicWork.id = self.id
        publicWork.name = self.name
        publicWork.idAddress = self.address.id
        publicWork.typeWorkFlag = self.typeWorkFlag
        publicWork.userStatusFlag = self.userStatus
        publicWork.toSend = false
        publicWork.address = self.address.toAddressDB()
        return publicWork
    }
}
