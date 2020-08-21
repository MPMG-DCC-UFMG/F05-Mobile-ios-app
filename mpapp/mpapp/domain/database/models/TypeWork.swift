import Foundation
import RealmSwift

class TypeWork: Object,Identifiable {
    @objc dynamic var flag = 0
    @objc dynamic var name = ""
    @objc dynamic var status = ""
    
    override static func primaryKey() -> String? {
        return "flag"
    }
    
    static func fromValues(flag: Int,name: String, status:String) -> TypeWork{
        let typeWork = TypeWork()
        typeWork.flag = flag
        typeWork.name = name
        typeWork.status = status
        return typeWork
    }
}
