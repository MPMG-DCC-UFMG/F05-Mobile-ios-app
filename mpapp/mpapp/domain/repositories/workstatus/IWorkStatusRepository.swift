import Foundation
import RealmSwift

protocol IWorkStatusRepository: ILocalWorkStatusDataSource {
    
    func listWorKStatusByFlags(workStatusFlags: [Int]) -> Results<WorkStatus>
}
