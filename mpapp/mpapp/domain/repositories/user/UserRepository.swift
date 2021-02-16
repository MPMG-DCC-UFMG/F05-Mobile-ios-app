import Foundation
import PromiseKit

class UserRepository{
    
    let remoteUserDataSource: RemoteUserDataSource
    
    init(remoteUserDataSource: RemoteUserDataSource) {
        self.remoteUserDataSource = remoteUserDataSource
    }
    
    func createUser(userRemote: MPUserRemote) -> Promise<ResponseRemote> {
        return self.remoteUserDataSource.createUser(userRemote: userRemote)
    }
    
    func login(email: String, password: String) -> Promise<TokenRemote> {
        return self.remoteUserDataSource.login(email: email, password: password)
    }
}
