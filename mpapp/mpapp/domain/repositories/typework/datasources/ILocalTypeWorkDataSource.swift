import Foundation
import RealmSwift


protocol ILocalTypeWorkDataSource {
    
    func insertTypeWork(typeWork: TypeWork)

    func insertTypeWorks(typeWorks: Array<TypeWork>)

    func listAllTypeWorks() -> Results<TypeWork>
}
