import Foundation

class LocalCollectDataSource: BaseDataSource<Collect>, ILocalCollectDataSource{
    
    func deleteCollect(collect: Collect,publicWork: PublicWork) throws {
        let collectDb = self.mpDatabase().object(ofType: Collect.self, forPrimaryKey: collect.id)
        if(collectDb != nil){
            try self.mpDatabase().write{
                self.mpDatabase().delete(collectDb!)
                publicWork.idCollect = nil
                self.mpDatabase().add(publicWork,update: .modified)
            }
        }
    }
    
    func getCollectByPublicWorkId(publicWorkId: String) -> Collect?{
        return self.listAll().filter(NSPredicate(format: "idPublicWork == %@",publicWorkId)).first
    }
    
    func insertCollect(collect: Collect,publicWork: PublicWork) throws {
        try self.mpDatabase().write{
            self.mpDatabase().add(collect,update: .modified)
            publicWork.idCollect = collect.id
            self.mpDatabase().add(publicWork,update: .modified)
        }
    }
    
    func insertCollect(collect: CollectUI,publicWork: PublicWork) throws {
        try self.mpDatabase().write{
            self.mpDatabase().add(collect.toDB(),update: .modified)
            publicWork.idCollect = collect.getId()
            self.mpDatabase().add(publicWork,update: .modified)
        }
    }
}
