import Foundation
import Promises
import Gloss

class ConfigRepository: IConfigRepository {
    
    let localConfigDataSource: ILocalConfigDataSource
    let remoteConfigDataSource: IRemoteConfigDataSource
    
    init(localConfigDataSource: ILocalConfigDataSource,
         remoteConfigDataSource: IRemoteConfigDataSource) {
        self.localConfigDataSource = localConfigDataSource
        self.remoteConfigDataSource = remoteConfigDataSource
    }
    
    func currentTypeWorksVersion() -> Int {
        return localConfigDataSource.currentTypeWorksVersion()
    }
    
    func currentPublicWorkVersion() -> Int {
        return localConfigDataSource.currentPublicWorkVersion()
    }
    
    func currentTypePhotosVersion() -> Int {
        return localConfigDataSource.currentTypePhotosVersion()
    }
    
    func currentAssociationVersion() -> Int {
        return localConfigDataSource.currentAssociationVersion()
    }
    
    func currentWorkStatusVersion() -> Int {
        return localConfigDataSource.currentWorkStatusVersion()
    }
    
    func currentCityVersion() -> Int {
        return localConfigDataSource.currentCityVersion()
    }
    
    func saveTypePhotosVersion(typePhotosVersion: Int) {
        localConfigDataSource.saveTypePhotosVersion(typePhotosVersion: typePhotosVersion)
    }
    
    func savePublicWorkVersion(publicWorkVersion: Int) {
        localConfigDataSource.savePublicWorkVersion(publicWorkVersion: publicWorkVersion)
    }
    
    func saveTypeWorksVersion(typeWorksVersion: Int) {
        localConfigDataSource.saveTypeWorksVersion(typeWorksVersion: typeWorksVersion)
    }
    
    func saveAssociationsVersion(associationVersion: Int) {
        localConfigDataSource.saveAssociationsVersion(associationVersion: associationVersion)
    }
    
    func saveWorkStatusVersion(workStatusVersion: Int) {
        localConfigDataSource.saveWorkStatusVersion(workStatusVersion: workStatusVersion)
    }
    
    func saveCityVersion(cityVersion: Int) {
        localConfigDataSource.saveCityVersion(cityVersion: cityVersion)
    }
    
    func loadTypeWorks() -> Promise<Array<JSONDecodable>> {
        return remoteConfigDataSource.loadTypeWorks()
    }
    
    func getTypeWorkVersion() -> Promise<EntityVersion> {
        return remoteConfigDataSource.getTypeWorkVersion()
    }
    
    func loadTypePhotos() -> Promise<Array<JSONDecodable>> {
        return remoteConfigDataSource.loadTypePhotos()
    }
    
    func getTypePhotosVersion() -> Promise<EntityVersion> {
        return remoteConfigDataSource.getTypePhotosVersion()
    }
    
    func loadCities() -> Promise<Array<JSONDecodable>>{
        return remoteConfigDataSource.loadCities()
    }
    
    func getCityVersion() -> Promise<EntityVersion>{
        return remoteConfigDataSource.getCityVersion()
    }
}
