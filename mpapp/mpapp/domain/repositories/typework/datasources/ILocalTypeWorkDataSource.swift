import Foundation
import RealmSwift


protocol ILocalTypeWorkDataSource {
    
    func insertTypeWork(typeWork: TypeWork) throws

    func insertTypeWorks(typeWorks: Array<TypeWork>) throws

    func listAllTypeWorks() -> Results<TypeWork>

    func deleteTypeWorks() throws
    
    func getTypeWorkByFlag(typeWorkFlag: Int) -> TypeWork?
}
