import Foundation
import RealmSwift

class TypePhoto: Object,Identifiable{
    
    @objc dynamic var flag = 0
    @objc dynamic var name = ""
    @objc dynamic var comment: String? = nil
    
    override static func primaryKey() -> String? {
        return "flag"
    }

}
