import Foundation

class LocalCollectDataSource: BaseDataSource<Collect>{
    
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
    
    func deletePhotoById(_ photoId: String) throws{
        let photoDb = self.mpDatabase().object(ofType: Photo.self, forPrimaryKey: photoId)
        if(photoDb != nil){
            try self.mpDatabase().write{
                self.mpDatabase().delete(photoDb!)
            }
        }
    }
    
    func getCollectByPublicWorkId(publicWorkId: String) -> Collect?{
        return self.listAll().filter(NSPredicate(format: "idPublicWork == %@",publicWorkId)).first
    }
    
    func getCollectByCollectId(collectId: String) -> Collect? {
        return self.mpDatabase().object(ofType: Collect.self, forPrimaryKey: collectId)
    }
    
    func getPhotoByCollectId(collectId: String) -> [Photo]{
        return self.mpDatabase().objects(Photo.self).filter(NSPredicate(format: "idCollect == %@",collectId)).toArray()
    }
    
    func insertCollect(collect: Collect,publicWork: PublicWork) throws {
        try self.mpDatabase().write{
            self.mpDatabase().add(collect,update: .modified)
            publicWork.idCollect = collect.id
            self.mpDatabase().add(publicWork,update: .modified)
        }
    }
    
    func insertCollect(collect: CollectUI,publicWork: PublicWork, photoUI: [PhotoUI]) throws {
        try self.mpDatabase().write{
            self.mpDatabase().add(collect.toDB(),update: .modified)
            photoUI.forEach{ photo in
                self.mpDatabase().add(photo.toDB(),update: .modified)
            }
            publicWork.idCollect = collect.getId()
            self.mpDatabase().add(publicWork,update: .modified)
        }
    }
}
