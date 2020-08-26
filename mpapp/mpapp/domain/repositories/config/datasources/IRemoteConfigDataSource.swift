import Foundation
import Promises
import Gloss

protocol IRemoteConfigDataSource {
    
    func loadTypeWorks() -> Promise<Array<JSONDecodable>>
    
    func getTypeWorkVersion() -> Promise<EntityVersion>
    
    func loadTypePhotos() -> Promise<Array<JSONDecodable>>
    
    func getTypePhotosVersion() -> Promise<EntityVersion>
    
    func loadCities() -> Promise<Array<JSONDecodable>>
    
    func getCityVersion() -> Promise<EntityVersion>
    
    func loadWorkStatus() -> Promise<Array<JSONDecodable>>
    
    func getWorkStatusVersion() -> Promise<EntityVersion>
    
    func loadAssociationTPTW() -> Promise<Array<JSONDecodable>>
    
    func getAssociationTPTWVersion() -> Promise<EntityVersion>
    
    func loadPublicWorkChanges(currVersion: Int) -> Promise<Array<JSONDecodable>>
    
    func getPublicWorkVersion() -> Promise<EntityVersion>
}
