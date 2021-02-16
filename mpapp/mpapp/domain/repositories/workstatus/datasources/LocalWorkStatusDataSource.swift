import Foundation
import RealmSwift

class LocalWorkStatusDataSource: BaseDataSource<WorkStatus>{
    
    func insertWorkStatus(workStatus: WorkStatus) throws {
        try self.insert(entity: workStatus)
    }
    
    func insertWorkStatuses(workStatuses: Array<WorkStatus>) throws {
        try self.insertAll(entities: workStatuses)
    }
    
    func listWorkStatus() -> Results<WorkStatus> {
        return self.listAll()
    }
    
    func deleteWorkStatuses() throws{
        try self.deleteAll()
    }
}
