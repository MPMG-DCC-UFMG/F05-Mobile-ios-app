import Foundation
import Alamofire
import PromiseKit

protocol IRemoteUserDataSource {
    
    func createUser(userRemote: MPUserRemote) -> Promise<ResponseRemote>
}