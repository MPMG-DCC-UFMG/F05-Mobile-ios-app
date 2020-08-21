import Foundation
import RealmSwift

class LocalTypeWorkDataSource: BaseDataSource,ILocalTypeWorkDataSource {
    
    func insertTypeWork(typeWork: TypeWork){
        try! self.mpDatabase().write{
            self.mpDatabase().add(typeWork)
        }
    }
    
    func insertTypeWorks(typeWorks: Array<TypeWork>){
        try! self.mpDatabase().write{
            self.mpDatabase().add(typeWorks)
        }
    }
    
    func listAllTypeWorks() -> Results<TypeWork>{
        return self.mpDatabase().objects(TypeWork.self)
    }
}
