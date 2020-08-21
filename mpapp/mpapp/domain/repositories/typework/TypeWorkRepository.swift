import Foundation
import RealmSwift


class TypeWorkRepository: ITypeWorkRepository {
    
    let localTypeWorkDataSource: ILocalTypeWorkDataSource
    
    init(localTypeWorkDataSource: ILocalTypeWorkDataSource) {
        self.localTypeWorkDataSource = localTypeWorkDataSource
    }
    
    func insertTypeWork(typeWork: TypeWork) {
        self.localTypeWorkDataSource.insertTypeWork(typeWork: typeWork)
    }
    
    func insertTypeWorks(typeWorks: Array<TypeWork>) {
        self.localTypeWorkDataSource.insertTypeWorks(typeWorks: typeWorks)
    }
    
    func listAllTypeWorks() -> Results<TypeWork> {
        return self.localTypeWorkDataSource.listAllTypeWorks()
    }
}
