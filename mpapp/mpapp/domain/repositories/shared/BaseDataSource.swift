import Foundation
import RealmSwift

class BaseDataSource {
    
    func mpDatabase()-> Realm {
        return MPDatabase.getInstance()!
    }
}
