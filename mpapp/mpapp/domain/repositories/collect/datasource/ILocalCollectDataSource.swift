import Foundation

protocol ILocalCollectDataSource {
    
    func insertCollect(collect: Collect,publicWork: PublicWork) throws
    
    func insertCollect(collect: CollectUI,publicWork: PublicWork,photoUI: [PhotoUI]) throws
    
    func deleteCollect(collect: Collect,publicWork: PublicWork) throws
    
    func getCollectByPublicWorkId(publicWorkId: String) -> Collect?
    
    func getCollectByCollectId(collectId: String) -> Collect?
    
    func getPhotoByCollectId(collectId: String) -> [Photo]
    
    func deletePhotoById(_ photoId: String) throws
}
