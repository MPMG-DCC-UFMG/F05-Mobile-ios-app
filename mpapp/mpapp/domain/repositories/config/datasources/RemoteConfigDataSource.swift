import Foundation
import Gloss
import Alamofire
import PromiseKit

class RemoteConfigDataSource: IRemoteConfigDataSource{
    
    func loadTypeWorks() -> Promise<Array<JSONDecodable>> {
        return firstly{
            MPApi.loadTypeWorks(nil)
        }.map{ data in
            guard let parsed = [TypeWorkRemote].from(data: data) else{
                return [TypeWorkRemote]()
            }
            return parsed
        }
    }
    
    
    func getTypeWorkVersion() -> Promise<EntityVersion>{
        return firstly{
            MPApi.getTypeWorkVersion(nil)
        }.map{ data in
            EntityVersion(data: data)!
        }
    }
    
    func loadTypePhotos() -> Promise<Array<JSONDecodable>> {
        return firstly{
            MPApi.loadTypePhotos(nil)
        }.map{ data in
            guard let parsed = [TypePhotoRemote].from(data: data) else{
                return [TypePhotoRemote]()
            }
            return parsed
        }
    }
    
    func getTypePhotosVersion() -> Promise<EntityVersion> {
        return firstly{
            MPApi.getTypePhotosVersion(nil)
        }.map{ data in
            EntityVersion(data: data)!
        }
    }
    
    func loadCities() -> Promise<Array<JSONDecodable>>{
        return firstly{
            MPApi.loadCities(nil)
        }.map{ data in
            guard let parsed = [CityRemote].from(data: data) else{
                return [CityRemote]()
            }
            return parsed
        }
    }
    
    func getCityVersion() -> Promise<EntityVersion>{
        return firstly{
            MPApi.getCitiesVersion(nil)
        }.map{ data in
            EntityVersion(data: data)!
        }
    }
    
    func loadWorkStatus() -> Promise<Array<JSONDecodable>>{
        return firstly{
            MPApi.loadWorkStatus(nil)
        }.map{ data in
            guard let parsed = [WorkStatusRemote].from(data: data) else{
                return [WorkStatusRemote]()
            }
            return parsed
        }
        
    }
    
    func getWorkStatusVersion() -> Promise<EntityVersion>{
        return firstly{
            MPApi.getWorkStatusVersion(nil)
        }.map{ data in
            EntityVersion(data: data)!
        }
    }
    
    func loadAssociationTPTW() -> Promise<Array<JSONDecodable>>{
        return firstly{
            MPApi.loadAssociation(nil)
        }.map{ data in
            guard let parsed = [AssociationTPTWRemote].from(data: data) else{
                return [AssociationTPTWRemote]()
            }
            return parsed
        }
    }
    
    func getAssociationTPTWVersion() -> Promise<EntityVersion>{
        return firstly{
            MPApi.getAssociationsVersion(nil)
        }.map{ data in
            EntityVersion(data: data)!
        }
    }
    
    func loadPublicWorkChanges(currVersion: Int) -> Promise<Array<JSONDecodable>> {
        let queryParameters : Parameters = ["version": currVersion]
        return firstly{
            MPApi.loadPublicWorksChange(queryParameters)
        }.map{ data in
            guard let parsed = [PublicWorkRemote].from(data: data) else{
                return [PublicWorkRemote]()
            }
            return parsed
        }
    }
    
    func getPublicWorkVersion() -> Promise<EntityVersion> {
        return firstly{
            MPApi.getPublicWorkVersion(nil)
        }.map{ data in
            EntityVersion(data: data)!
        }
    }
    
}
