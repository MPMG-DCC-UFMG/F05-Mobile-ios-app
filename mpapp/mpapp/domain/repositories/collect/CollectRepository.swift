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
    
    func insertCollect(collect: CollectUI,publicWork: PublicWork) throws {
        try self.localCollectDataSource.insertCollect(collect: collect,publicWork:publicWork)
    }
    
    func deleteCollect(collect: Collect,publicWork: PublicWork) throws {
        try self.localCollectDataSource.deleteCollect(collect: collect,publicWork:publicWork)
    }

}
