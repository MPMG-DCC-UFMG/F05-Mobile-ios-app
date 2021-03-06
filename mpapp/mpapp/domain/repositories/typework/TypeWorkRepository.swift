import Foundation
import RealmSwift


class TypeWorkRepository {
    
    private let localTypeWorkDataSource: LocalTypeWorkDataSource
    
    init(localTypeWorkDataSource: LocalTypeWorkDataSource) {
        self.localTypeWorkDataSource = localTypeWorkDataSource
    }
    
    func insertTypeWork(typeWork: TypeWork) throws {
        try self.localTypeWorkDataSource.insertTypeWork(typeWork: typeWork)
    }
    
    func insertTypeWorks(typeWorks: Array<TypeWork>) throws {
        try self.localTypeWorkDataSource.insertTypeWorks(typeWorks: typeWorks)
    }
    
    func listAllTypeWorks() -> Results<TypeWork> {
        return self.localTypeWorkDataSource.listAllTypeWorks()
    }

    func deleteTypeWorks() throws {
        try self.localTypeWorkDataSource.deleteTypeWorks()
    }
    
    func getTypeWorkByFlag(typeWorkFlag: Int) -> TypeWork?{
        return self.localTypeWorkDataSource.getTypeWorkByFlag(typeWorkFlag: typeWorkFlag)
    }
}
