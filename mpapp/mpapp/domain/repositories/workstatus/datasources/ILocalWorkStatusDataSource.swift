import Foundation
import RealmSwift

protocol ILocalWorkStatusDataSource {
    
    func insertWorkStatus(workStatus: WorkStatus) throws

    func insertWorkStatuses(workStatuses: Array<WorkStatus>) throws
    
    func listWorkStatus() -> Results<WorkStatus>
    
    func deleteWorkStatuses() throws
}
