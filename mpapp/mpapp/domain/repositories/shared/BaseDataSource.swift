import Foundation
import RealmSwift

class BaseDataSource<T: Object> {
    
    func mpDatabase()-> Realm {
        return MPDatabase.getInstance()!
    }
    
    internal func insert(entity: T) throws {
        try self.mpDatabase().write{
            self.mpDatabase().add(entity,update: .modified)
        }
    }
    
    internal func delete(entity: T) throws{
        try self.mpDatabase().write{
            self.mpDatabase().delete(entity)
        }
    }
    
    internal func deleteAll() throws{
        try self.mpDatabase().write{
            self.mpDatabase().delete(self.listAll())
        }
        
    }
    
    internal func insertAll(entities: Array<T>) throws {
        try self.mpDatabase().write{
            self.mpDatabase().add(entities,update: .modified)
        }
    }
    
    internal func listAll() -> Results<T> {
        return self.mpDatabase().objects(T.self)
    }
}
