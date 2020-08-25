import Foundation
import RealmSwift


protocol ILocalTypeWorkDataSource {
    
    func insertTypeWork(typeWork: TypeWork) throws

    func insertTypeWorks(typeWorks: Array<TypeWork>) throws

    func listAllTypeWorks() -> Results<TypeWork>
}
