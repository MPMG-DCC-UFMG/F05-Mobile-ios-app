import Foundation

class CollectRepository: ICollectRepository{
    
    
    private let localCollectDataSource: ILocalCollectDataSource
    
    init(localCollectDataSource: ILocalCollectDataSource) {
        self.localCollectDataSource = localCollectDataSource
    }
    
    func insertCollect(collect: Collect,publicWork: PublicWork) throws {
        try self.localCollectDataSource.insertCollect(collect: collect,publicWork:publicWork)
    }
    
    func getCollectByPublicWorkId(publicWorkId: String) -> Collect? {
        return self.localCollectDataSource.getCollectByPublicWorkId(publicWorkId: publicWorkId)
    }
    
    func insertCollect(collect: CollectUI,publicWork: PublicWork,photoUI: [PhotoUI]) throws {
        try self.localCollectDataSource.insertCollect(collect: collect,publicWork:publicWork,photoUI:photoUI)
    }
    
    func deleteCollect(collect: Collect,publicWork: PublicWork) throws {
        try self.localCollectDataSource.deleteCollect(collect: collect,publicWork:publicWork)
    }
    
    func getPhotoByCollectId(collectId: String) -> [Photo]{
        return self.localCollectDataSource.getPhotoByCollectId(collectId: collectId)
    }
    
    func deletePhotoById(_ photoId: String) throws{
        try self.localCollectDataSource.deletePhotoById(photoId)
    }

}
