import Foundation
import RealmSwift

class LocalTypeWorkDataSource: BaseDataSource,ILocalTypeWorkDataSource {
    
    func insertTypeWork(typeWork: TypeWork) throws {
        do {
            try self.mpDatabase().write{
                self.mpDatabase().add(typeWork)
            }
        } catch {
            throw error
        }
    }
    
    func insertTypeWorks(typeWorks: Array<TypeWork>) throws{
        do {
            try self.mpDatabase().write{
                self.mpDatabase().add(typeWorks)
            }
        } catch {
            throw error
        }
    }
    
    func listAllTypeWorks() -> Results<TypeWork>{
        return self.mpDatabase().objects(TypeWork.self)
    }
}
