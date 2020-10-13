import Foundation
import PromiseKit

protocol IRemoteConfigDataSource {
    
    func loadTypeWorks() -> Promise<Array<Decodable>>
    
    func getTypeWorkVersion() -> Promise<EntityVersion>
    
    func loadTypePhotos() -> Promise<Array<Decodable>>
    
    func getTypePhotosVersion() -> Promise<EntityVersion>
    
    func loadCities() -> Promise<Array<Decodable>>
    
    func getCityVersion() -> Promise<EntityVersion>
    
    func loadWorkStatus() -> Promise<Array<Decodable>>
    
    func getWorkStatusVersion() -> Promise<EntityVersion>
    
    func loadAssociationTPTW() -> Promise<Array<Decodable>>
    
    func getAssociationTPTWVersion() -> Promise<EntityVersion>
    
    func loadPublicWorkChanges(currVersion: Int) -> Promise<Array<Decodable>>
    
    func getPublicWorkVersion() -> Promise<EntityVersion>
}
