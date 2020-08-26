import Foundation
import Gloss

class PublicWorkRemote: JSONDecodable{
    let id: String?
    let name: String?
    let typeWorkFlag: Int?
    let address: AddressRemote?
    let operation: Int?
    let userStatus: Int?
    
    required init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.typeWorkFlag = "type_work_flag" <~~ json
        self.address = "address" <~~ json
        self.operation = "operation" <~~ json
        self.userStatus = "user_status" <~~ json
    }
    
    func toPublicWorkDB() -> PublicWork{
        let publicWork =  PublicWork()
        publicWork.id = self.id!
        publicWork.name = self.name!
        publicWork.idAddress = self.address!.id!
        publicWork.typeWorkFlag = self.typeWorkFlag!
        publicWork.userStatusFlag = self.userStatus!
        publicWork.toSend = false
        publicWork.address = self.address!.toAddressDB()
        return publicWork
    }
}
