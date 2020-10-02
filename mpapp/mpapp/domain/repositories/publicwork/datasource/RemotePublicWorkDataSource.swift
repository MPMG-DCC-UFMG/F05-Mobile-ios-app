import Foundation
import PromiseKit

class RemotePublicWorkDataSource: IRemotePublicWorkDataSource{
    
    func sendPublicWork(publicWorkRemote: PublicWorkRemote) -> Promise<PublicWorkRemote>{
        return firstly{
            MPApi.sendPublicWork(publicWorkRemote.toParameter())
        }.map{ data in
            PublicWorkRemote(data)
        }
    }
}
