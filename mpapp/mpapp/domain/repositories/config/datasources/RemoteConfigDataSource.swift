import Foundation
import Promises
import Gloss
import Alamofire

class RemoteConfigDataSource: IRemoteConfigDataSource{

    func loadTypeWorks() -> Promise<Array<JSONDecodable>> {
        return MPApi.loadTypeWorks(nil).then{data -> [TypeWorkRemote] in
            guard let parsed = [TypeWorkRemote].from(data: data) else{
                return [TypeWorkRemote]()
            }
            return parsed
        }
    }
    
    func getTypeWorkVersion() -> Promise<EntityVersion>{
        return MPApi.getTypeWorkVersion(nil).then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
    func loadTypePhotos() -> Promise<Array<JSONDecodable>> {
        return MPApi.loadTypePhotos(nil).then{data -> [TypePhotoRemote] in
            guard let parsed = [TypePhotoRemote].from(data: data) else{
                return [TypePhotoRemote]()
            }
            return parsed
        }
    }
    
    func getTypePhotosVersion() -> Promise<EntityVersion> {
        return MPApi.getTypePhotosVersion(nil).then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
    func loadCities() -> Promise<Array<JSONDecodable>>{
        return MPApi.loadCities(nil).then{data -> [CityRemote] in
            guard let parsed = [CityRemote].from(data: data) else{
                return [CityRemote]()
            }
            return parsed
        }
    }
    
    func getCityVersion() -> Promise<EntityVersion>{
        return MPApi.getCitiesVersion(nil).then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
    func loadWorkStatus() -> Promise<Array<JSONDecodable>>{
        return MPApi.loadWorkStatus(nil).then{data -> [WorkStatusRemote] in
            guard let parsed = [WorkStatusRemote].from(data: data) else{
                return [WorkStatusRemote]()
            }
            return parsed
        }
    }
    
    func getWorkStatusVersion() -> Promise<EntityVersion>{
        return MPApi.getWorkStatusVersion(nil).then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
    func loadAssociationTPTW() -> Promise<Array<JSONDecodable>>{
        return MPApi.loadAssociation(nil).then{data -> [AssociationTPTWRemote] in
            guard let parsed = [AssociationTPTWRemote].from(data: data) else{
                return [AssociationTPTWRemote]()
            }
            return parsed
        }
    }
    
    func getAssociationTPTWVersion() -> Promise<EntityVersion>{
        return MPApi.getAssociationsVersion(nil).then { data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
    func loadPublicWorkChanges(currVersion: Int) -> Promise<Array<JSONDecodable>> {
        let queryParameters : Parameters = ["version": currVersion]
        return MPApi.loadPublicWorksChange(queryParameters).then{ data -> [PublicWorkRemote] in
            guard let parsed = [PublicWorkRemote].from(data: data) else{
                return [PublicWorkRemote]()
            }
            return parsed
        }
    }
    
    func getPublicWorkVersion() -> Promise<EntityVersion> {
        return MPApi.getPublicWorkVersion(nil).then{data -> EntityVersion in
            EntityVersion(data: data)!
        }
    }
    
}
