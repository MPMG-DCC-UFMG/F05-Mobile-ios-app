import Foundation
import Alamofire
import PromiseKit

class RemoteUserDataSource{
        
    func createUser(userRemote: MPUserRemote) -> Promise<ResponseRemote>{
        return firstly{
            MPApi.createUser(userRemote.toParameter())
        }.map{ data in
            ResponseRemote(data)
        }
    }
    
    func login(email: String, password: String) -> Promise<TokenRemote>{
        return firstly{
            MPApi.login(email, password)
        }.map{data in
            TokenRemote(data)
        }
    }
}
