import Foundation
import PromiseKit

protocol IRemotePublicWorkDataSource {
    
    func sendPublicWork(publicWorkRemote: PublicWorkRemote) -> Promise<ResponseRemote>
}
