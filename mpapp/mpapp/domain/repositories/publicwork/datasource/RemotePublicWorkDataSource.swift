import Foundation
import PromiseKit

class RemotePublicWorkDataSource{
    
    func sendPublicWork(publicWorkRemote: PublicWorkRemote) -> Promise<ResponseRemote>{
        return firstly{
            MPApi.sendPublicWork(publicWorkRemote.toParameter())
        }.map{ data in
            ResponseRemote(data)
        }
    }
}
