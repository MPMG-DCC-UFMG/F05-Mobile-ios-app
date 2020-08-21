import Foundation
import RealmSwift

struct MPDatabase {
    
    private static var INSTANCE : Realm? = nil
    
    static func getInstance() -> Realm?{
        if(INSTANCE == nil){
            INSTANCE = try! Realm()
        }
        return INSTANCE
    }
}
