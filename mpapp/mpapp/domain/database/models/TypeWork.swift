import Foundation
import RealmSwift

class TypeWork: Object,Identifiable {
    
    @objc dynamic var flag = 0
    @objc dynamic var name = ""
    @objc dynamic var status = ""
    
    override static func primaryKey() -> String? {
        return "flag"
    }

}
