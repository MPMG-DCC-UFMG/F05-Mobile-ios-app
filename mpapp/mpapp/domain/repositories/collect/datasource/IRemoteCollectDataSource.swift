import Foundation
import PromiseKit

protocol IRemoteCollectDataSource {
    
    func sendCollect(collectRemote: CollectRemote) -> Promise<CollectRemote>
}
