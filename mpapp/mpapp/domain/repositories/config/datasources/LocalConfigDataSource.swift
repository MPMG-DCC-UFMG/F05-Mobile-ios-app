import Foundation

class LocalConfigDataSource: ILocalConfigDataSource {
    
    private let preferences = UserDefaults.standard
    
    private func saveVersion(key: String, version: Int){
        preferences.set(version,forKey: key)
        preferences.synchronize()
    }
    
    private func getSavedVersion(key: String) -> Int{
        if preferences.object(forKey: key) == nil {
            return -1
        } else {
            return preferences.integer(forKey: key)
        }
    }
    
    func currentTypeWorksVersion() -> Int {
        getSavedVersion(key: Constants.PREFERENCES_TYPE_WORKS_VERSION_KEY)
    }
    
    func currentPublicWorkVersion() -> Int {
        getSavedVersion(key: Constants.PREFERENCES_PUBLIC_WORK_VERSION_KEY)
    }
    
    func currentTypePhotosVersion() -> Int {
        getSavedVersion(key: Constants.PREFERENCES_TYPE_PHOTOS_VERSION_KEY)
    }
    
    func currentAssociationVersion() -> Int {
        getSavedVersion(key: Constants.PREFERENCES_ASSOCIATION_VERSION_KEY)
    }
    
    func currentWorkStatusVersion() -> Int {
        getSavedVersion(key: Constants.PREFERENCES_WORK_STATUS_VERSION_KEY)
    }
    
    func currentCityVersion() -> Int {
        getSavedVersion(key: Constants.PREFERENCES_CITY_VERSION_KEY)
    }
    
    func saveTypePhotosVersion(typePhotosVersion: Int) {
        saveVersion(key: Constants.PREFERENCES_TYPE_PHOTOS_VERSION_KEY, version: typePhotosVersion)
    }
    
    func savePublicWorkVersion(publicWorkVersion: Int) {
        saveVersion(key: Constants.PREFERENCES_PUBLIC_WORK_VERSION_KEY, version: publicWorkVersion)
    }
    
    func saveTypeWorksVersion(typeWorksVersion: Int) {
        saveVersion(key: Constants.PREFERENCES_TYPE_WORKS_VERSION_KEY, version: typeWorksVersion)
    }
    
    func saveAssociationsVersion(associationVersion: Int) {
        saveVersion(key: Constants.PREFERENCES_ASSOCIATION_VERSION_KEY, version: associationVersion)
    }
    
    func saveWorkStatusVersion(workStatusVersion: Int) {
        saveVersion(key: Constants.PREFERENCES_WORK_STATUS_VERSION_KEY, version: workStatusVersion)
    }
    
    func saveCityVersion(cityVersion: Int) {
        saveVersion(key: Constants.PREFERENCES_CITY_VERSION_KEY, version: cityVersion)
    }
        
}
