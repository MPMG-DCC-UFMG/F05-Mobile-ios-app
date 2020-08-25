import Foundation
import Promises
import Gloss

class RemoteConfigDataSource: IRemoteConfigDataSource{
    
    func loadTypeWorks() -> Promise<Array<JSONDecodable>> {
        return MPApi.loadTypeWorks.then{data -> [TypeWorkRemote] in
            guard let parsed = [TypeWorkRemote].from(data: data) else{
                return [TypeWorkRemote]()
            }
            return parsed
        }
    }
    
    func getTypeWorkVersion() -> Promise<EntityVersion>{
        return MPApi.getTypeWorkVersion.then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
}
