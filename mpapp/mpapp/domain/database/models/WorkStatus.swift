import Foundation
import RealmSwift

class WorkStatus: Object,Identifiable{
    @objc dynamic var flag = 0
    @objc dynamic var name = ""
    @objc dynamic var comment: String? = nil
    
    override static func primaryKey() -> String? {
        return "flag"
    }
    
    static func fromValues(flag: Int,name: String, comment:String?) -> WorkStatus{
        let workStatus = WorkStatus()
        workStatus.flag = flag
        workStatus.name = name
        workStatus.comment = comment
        return workStatus
    }
}
