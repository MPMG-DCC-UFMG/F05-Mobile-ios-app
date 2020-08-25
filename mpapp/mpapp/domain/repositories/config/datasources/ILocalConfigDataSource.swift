import Foundation

protocol ILocalConfigDataSource {
    
    func currentTypeWorksVersion() -> Int
    
    func currentPublicWorkVersion() -> Int
    
    func currentTypePhotosVersion() -> Int
    
    func currentAssociationVersion() -> Int
    
    func currentWorkStatusVersion() -> Int
    
    func currentCityVersion() -> Int
    
    func saveTypePhotosVersion(typePhotosVersion: Int)
    
    func savePublicWorkVersion(publicWorkVersion: Int)
    
    func saveTypeWorksVersion(typeWorksVersion: Int)
    
    func saveAssociationsVersion(associationVersion: Int)
    
    func saveWorkStatusVersion(workStatusVersion: Int)
    
    func saveCityVersion(cityVersion: Int)
    
}
