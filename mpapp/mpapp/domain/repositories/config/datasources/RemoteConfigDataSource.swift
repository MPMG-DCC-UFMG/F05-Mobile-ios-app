import Foundation
import Alamofire
import PromiseKit

class RemoteConfigDataSource{
    
    func loadTypeWorks() -> Promise<Array<Decodable>> {
        return firstly{
            MPApi.loadTypeWorks(nil)
        }.map{ data in
            let parsed =  try JSONDecoder().decode([TypeWorkRemote].self,from: data)
            return parsed
        }
    }
    
    
    func getTypeWorkVersion() -> Promise<EntityVersion>{
        return firstly{
            MPApi.getTypeWorkVersion(nil)
        }.map{ data in
            EntityVersion(data)
        }
    }
    
    func loadTypePhotos() -> Promise<Array<Decodable>> {
        return firstly{
            MPApi.loadTypePhotos(nil)
        }.map{ data in
            let parsed =  try JSONDecoder().decode([TypePhotoRemote].self,from: data)
            return parsed
        }
    }
    
    func getTypePhotosVersion() -> Promise<EntityVersion> {
        return firstly{
            MPApi.getTypePhotosVersion(nil)
        }.map{ data in
            EntityVersion(data)
        }
    }
    
    func loadCities() -> Promise<Array<Decodable>>{
        return firstly{
            MPApi.loadCities(nil)
        }.map{ data in
            let parsed =  try JSONDecoder().decode([CityRemote].self,from: data)
            return parsed
        }
    }
    
    func getCityVersion() -> Promise<EntityVersion>{
        return firstly{
            MPApi.getCitiesVersion(nil)
        }.map{ data in
            EntityVersion(data)
        }
    }
    
    func loadWorkStatus() -> Promise<Array<Decodable>>{
        return firstly{
            MPApi.loadWorkStatus(nil)
        }.map{ data in
            let parsed =  try JSONDecoder().decode([WorkStatusRemote].self,from: data)
            return parsed
        }
    }
    
    func getWorkStatusVersion() -> Promise<EntityVersion>{
        return firstly{
            MPApi.getWorkStatusVersion(nil)
        }.map{ data in
            EntityVersion(data)
        }
    }
    
    func loadAssociationTPTW() -> Promise<Array<Decodable>>{
        return firstly{
            MPApi.loadAssociation(nil)
        }.map{ data in
            let parsed =  try JSONDecoder().decode([AssociationTPTWRemote].self,from: data)
            return parsed
        }
    }
    
    func getAssociationTPTWVersion() -> Promise<EntityVersion>{
        return firstly{
            MPApi.getAssociationsVersion(nil)
        }.map{ data in
            EntityVersion(data)
        }
    }
    
    func loadPublicWorkChanges(currVersion: Int) -> Promise<Array<Decodable>> {
        let queryParameters : Parameters = ["version": currVersion]
        return firstly{
            MPApi.loadPublicWorksChange(queryParameters)
        }.map{ data in
            let parsed =  try JSONDecoder().decode([PublicWorkRemote].self,from: data)
            return parsed
        }
    }
    
    func getPublicWorkVersion() -> Promise<EntityVersion> {
        return firstly{
            MPApi.getPublicWorkVersion(nil)
        }.map{ data in
            EntityVersion(data)
        }
    }
    
}
