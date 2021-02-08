import Foundation
import RealmSwift

class LocalPublicWorkDataSource: BaseDataSource<PublicWork> {
    
    func deletePublicWork(publicWork: PublicWork) throws {
        try self.delete(entity: publicWork)
    }
    
    func insertPublicWork(publicWork: PublicWork) throws {
        let oldPublicWork = self.mpDatabase().object(ofType: PublicWork.self, forPrimaryKey: publicWork.id)
        if(oldPublicWork != nil && oldPublicWork!.toSend){
            return
        }else{
            try mpDatabase().write{
                publicWork.idCollect = oldPublicWork?.idCollect
                mpDatabase().add(publicWork,update: .modified)
            }
        }
    }
    
    func insertPublicWork(publicWork: PublicWorkUI) throws{
        try mpDatabase().write{
            mpDatabase().add(publicWork.toDbModel(),update: .modified)
        }
    }
    
    func insertPublicWorks(publicWorks: Array<PublicWork>) throws {
        try self.insertAll(entities: publicWorks)
    }
    
    func deletePublicWorkById(publicWorkId: String) throws{
        let publicWork = self.mpDatabase().object(ofType: PublicWork.self, forPrimaryKey: publicWorkId)
        if(publicWork != nil){
            let address = publicWork?.address
            try self.delete(entity: publicWork!)
            self.deleteAddress(address: address!)
        }
    }
    
    private func deleteAddress(address: Address){
        try! self.mpDatabase().write{
            self.mpDatabase().delete(address)
        }
    }
    
    func listAllPublicWorks() -> Results<PublicWork>{
        return self.listAll()
    }
    
    func getPublicWorkById(publicWorkId: String) -> PublicWork?{
        return self.mpDatabase().object(ofType: PublicWork.self, forPrimaryKey: publicWorkId)
    }
    
    func markPublicWorkCollectSent(publicWorkId: String) throws{
        guard let publicWork = self.mpDatabase().object(ofType: PublicWork.self, forPrimaryKey: publicWorkId) else{
            return
        }
        try mpDatabase().write{
            publicWork.idCollect = nil
            mpDatabase().add(publicWork,update: .modified)
        }
    }
    
    func markPublicWorkSent(publicWorkId: String) throws{
        guard let publicWork = self.mpDatabase().object(ofType: PublicWork.self, forPrimaryKey: publicWorkId) else{
            return
        }
        try mpDatabase().write{
            publicWork.toSend = false
            mpDatabase().add(publicWork,update: .modified)
        }
    }
}
