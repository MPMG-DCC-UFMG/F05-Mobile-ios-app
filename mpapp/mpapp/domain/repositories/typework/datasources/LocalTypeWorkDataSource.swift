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
        let all = self.listAll()
        return all
    }
    
    func deleteTypeWorks() throws {
        try self.deleteAll()
    }
    
    func getTypeWorkByFlag(typeWorkFlag: Int) -> TypeWork?{
        return mpDatabase().object(ofType: TypeWork.self, forPrimaryKey: typeWorkFlag)
    }
}
