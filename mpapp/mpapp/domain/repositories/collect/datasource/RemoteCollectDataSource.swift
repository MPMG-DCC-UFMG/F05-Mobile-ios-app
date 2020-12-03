import Foundation
import PromiseKit

class RemoteCollectDataSource: IRemoteCollectDataSource{
    
    func sendCollect(collectRemote: CollectRemote) -> Promise<ResponseRemote> {
        return firstly{
            MPApi.sendCollect(collectRemote.toParameter())
        }.map{ data in
            ResponseRemote(data)
        }
    }

}
