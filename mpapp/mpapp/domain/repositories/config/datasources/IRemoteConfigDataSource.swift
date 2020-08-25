import Foundation
import Promises
import Gloss

protocol IRemoteConfigDataSource {
    
    func loadTypeWorks() -> Promise<Array<JSONDecodable>>
    
    func getTypeWorkVersion() -> Promise<EntityVersion>
}
