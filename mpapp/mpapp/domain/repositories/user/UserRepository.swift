import Foundation
import PromiseKit

class UserRepository: IUserRepository{
    
    let remoteUserDataSource: IRemoteUserDataSource
    
    init(remoteUserDataSource: IRemoteUserDataSource) {
        self.remoteUserDataSource = remoteUserDataSource
    }
    
    func createUser(userRemote: MPUserRemote) -> Promise<ResponseRemote> {
        return self.remoteUserDataSource.createUser(userRemote: userRemote)
    }
}
