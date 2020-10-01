import Foundation
import Alamofire
import PromiseKit

class RemoteUserDataSource : IRemoteUserDataSource{
    
    func createUser(userRemote: MPUserRemote) -> Promise<ResponseRemote>{
        return firstly{
            MPApi.createUser(userRemote.toParameter())
        }.map{ data in
            ResponseRemote(data)
        }
    }
}
