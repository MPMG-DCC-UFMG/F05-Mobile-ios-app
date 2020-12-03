import Foundation
import PromiseKit

class RemotePublicWorkDataSource: IRemotePublicWorkDataSource{
    
    func sendPublicWork(publicWorkRemote: PublicWorkRemote) -> Promise<ResponseRemote>{
        return firstly{
            MPApi.sendPublicWork(publicWorkRemote.toParameter())
        }.map{ data in
            ResponseRemote(data)
        }
    }
}
