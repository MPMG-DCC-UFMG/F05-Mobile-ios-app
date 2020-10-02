import Foundation
import PromiseKit

class RemoteCollectDataSource: IRemoteCollectDataSource{
    
    func sendCollect(collectRemote: CollectRemote) -> Promise<CollectRemote> {
        return firstly{
            MPApi.sendCollect(collectRemote.toParameter())
        }.map{ data in
            CollectRemote(data)
        }
    }

}
