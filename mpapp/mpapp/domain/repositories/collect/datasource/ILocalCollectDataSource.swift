import Foundation

protocol ILocalCollectDataSource {
    
    func insertCollect(collect: Collect,publicWork: PublicWork) throws
    
    func insertCollect(collect: CollectUI,publicWork: PublicWork) throws
    
    func deleteCollect(collect: Collect,publicWork: PublicWork) throws
    
    func getCollectByPublicWorkId(publicWorkId: String) -> Collect?
}
