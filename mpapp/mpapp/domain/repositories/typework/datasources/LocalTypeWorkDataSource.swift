import Foundation
import RealmSwift

class LocalTypeWorkDataSource: BaseDataSource<TypeWork>,ILocalTypeWorkDataSource {
    
    func insertTypeWork(typeWork: TypeWork) throws {
        try self.insert(entity: typeWork)
    }
    
    func insertTypeWorks(typeWorks: Array<TypeWork>) throws{
       try self.insertAll(entities: typeWorks)
    }
    
    func listAllTypeWorks() -> Results<TypeWork>{
        return self.listAll()
    }

    func deleteTypeWorks() throws {
        try self.deleteAll()
    }
}
