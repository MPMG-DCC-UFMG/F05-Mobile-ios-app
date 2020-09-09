import Foundation
import RealmSwift

class PublicWork: Object,Identifiable{
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var idCollect: String? = nil
    @objc dynamic var idAddress: String = ""
    @objc dynamic var address: Address? = nil
    @objc dynamic var typeWorkFlag = 1
    @objc dynamic var toSend = false
    @objc dynamic var userStatusFlag = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }

    func formatedAddress() -> String{
        if(address == nil){
            return ""
        }else{
            return "\(address?.street ?? ""), \(address?.number ?? "") - \(address?.neighborhood ?? "") , \(address?.city ?? "") - \(address?.cep ?? "")"
        }
    }
    
    func isPublicWorkValid() -> Bool{
        return !name.isEmpty
    }
}
