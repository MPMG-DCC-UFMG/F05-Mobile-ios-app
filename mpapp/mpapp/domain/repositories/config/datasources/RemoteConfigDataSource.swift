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
    
    func loadTypePhotos() -> Promise<Array<JSONDecodable>> {
        return MPApi.loadTypePhotos.then{data -> [TypePhotoRemote] in
            guard let parsed = [TypePhotoRemote].from(data: data) else{
                return [TypePhotoRemote]()
            }
            return parsed
        }
    }
    
    func getTypePhotosVersion() -> Promise<EntityVersion> {
        return MPApi.getTypePhotosVersion.then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
    func loadCities() -> Promise<Array<JSONDecodable>>{
        return MPApi.loadCities.then{data -> [CityRemote] in
            guard let parsed = [CityRemote].from(data: data) else{
                return [CityRemote]()
            }
            return parsed
        }
    }
    
    func getCityVersion() -> Promise<EntityVersion>{
        return MPApi.getCitiesVersion.then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
    func loadWorkStatus() -> Promise<Array<JSONDecodable>>{
        return MPApi.loadWorkStatus.then{data -> [WorkStatusRemote] in
            guard let parsed = [WorkStatusRemote].from(data: data) else{
                return [WorkStatusRemote]()
            }
            return parsed
        }
    }
    
    func getWorkStatusVersion() -> Promise<EntityVersion>{
        return MPApi.getWorkStatusVersion.then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
    func loadAssociationTPTW() -> Promise<Array<JSONDecodable>>{
        return MPApi.loadAssociation.then{data -> [AssociationTPTWRemote] in
            guard let parsed = [AssociationTPTWRemote].from(data: data) else{
                return [AssociationTPTWRemote]()
            }
            return parsed
        }
    }
    
    func getAssociationTPTWVersion() -> Promise<EntityVersion>{
        return MPApi.getAssociationsVersion.then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
}
