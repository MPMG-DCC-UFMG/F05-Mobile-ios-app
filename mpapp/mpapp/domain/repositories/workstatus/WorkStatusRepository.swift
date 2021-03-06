import Foundation
import RealmSwift

class WorkStatusRepository{
    
    private let localWorkStatusDataSource: LocalWorkStatusDataSource
    
    init(localWorkStatusDataSource: LocalWorkStatusDataSource) {
        self.localWorkStatusDataSource = localWorkStatusDataSource
    }
    
    func insertWorkStatus(workStatus: WorkStatus) throws{
        try self.localWorkStatusDataSource.insertWorkStatus(workStatus: workStatus)
    }

    func insertWorkStatuses(workStatuses: Array<WorkStatus>) throws{
        try self.localWorkStatusDataSource.insertWorkStatuses(workStatuses: workStatuses)
    }
    
    func listWorkStatus() -> Results<WorkStatus>{
        return self.localWorkStatusDataSource.listWorkStatus()
    }

    func deleteWorkStatuses() throws {
        try self.localWorkStatusDataSource.deleteWorkStatuses()
    }
    
    func listWorKStatusByFlags(workStatusFlags: [Int]) -> Results<WorkStatus>{
        return self.localWorkStatusDataSource.listWorkStatus().filter(NSPredicate(format: "self.flag IN %@", workStatusFlags))
    }
}
