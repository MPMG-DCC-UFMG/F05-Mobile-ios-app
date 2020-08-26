import Foundation

class LocalPublicWorkDataSource: BaseDataSource<PublicWork>, ILocalPublicWorkDataSource {
    
    func deletePublicWork(publicWork: PublicWork) throws {
        try self.delete(entity: publicWork)
    }
    
    func insertPublicWork(publicWork: PublicWork) throws {
        try self.insert(entity: publicWork)
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
}
