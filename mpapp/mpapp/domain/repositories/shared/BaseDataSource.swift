import Foundation
import RealmSwift

class BaseDataSource<T: Object> {
    
    func mpDatabase()-> Realm {
        return MPDatabase.getInstance()!
    }

    internal func insert(entity: T) throws {
        do {
            try self.mpDatabase().write{
                self.mpDatabase().add(entity)
            }
        } catch {
            throw error
        }
    }
    
    internal func insertAll(entities: Array<T>) throws {
        do {
           try self.mpDatabase().write{
               self.mpDatabase().add(entities)
           }
       } catch {
           throw error
       }
    }
    
    internal func listAll() -> Results<T> {
        return self.mpDatabase().objects(T.self)
    }
}
