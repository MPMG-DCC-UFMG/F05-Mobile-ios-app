import Foundation
import PromiseKit

class ConfigRepository {
    
    let localConfigDataSource: LocalConfigDataSource
    let remoteConfigDataSource: RemoteConfigDataSource
    
    init(localConfigDataSource: LocalConfigDataSource,
         remoteConfigDataSource: RemoteConfigDataSource) {
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
    
    func loadTypeWorks() -> Promise<Array<Decodable>> {
        return remoteConfigDataSource.loadTypeWorks()
    }
    
    func getTypeWorkVersion() -> Promise<EntityVersion> {
        return remoteConfigDataSource.getTypeWorkVersion()
    }
    
    func loadTypePhotos() -> Promise<Array<Decodable>> {
        return remoteConfigDataSource.loadTypePhotos()
    }
    
    func getTypePhotosVersion() -> Promise<EntityVersion> {
        return remoteConfigDataSource.getTypePhotosVersion()
    }
    
    func loadCities() -> Promise<Array<Decodable>>{
        return remoteConfigDataSource.loadCities()
    }
    
    func getCityVersion() -> Promise<EntityVersion>{
        return remoteConfigDataSource.getCityVersion()
    }
    
    func loadWorkStatus() -> Promise<Array<Decodable>>{
        return remoteConfigDataSource.loadWorkStatus()
    }
    
    func getWorkStatusVersion() -> Promise<EntityVersion>{
        return remoteConfigDataSource.getWorkStatusVersion()
    }
    
    func loadAssociationTPTW() -> Promise<Array<Decodable>>{
        return remoteConfigDataSource.loadAssociationTPTW()
    }
    
    func getAssociationTPTWVersion() -> Promise<EntityVersion>{
        return remoteConfigDataSource.getAssociationTPTWVersion()
    }
    
    func loadPublicWorkChanges(currVersion: Int) -> Promise<Array<Decodable>>{
        return remoteConfigDataSource.loadPublicWorkChanges(currVersion: currVersion)
    }
    
    func getPublicWorkVersion() -> Promise<EntityVersion>{
        return remoteConfigDataSource.getPublicWorkVersion()
    }
}
