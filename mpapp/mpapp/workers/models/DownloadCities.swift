import Foundation
import Resolver
import PromiseKit

class DownloadCities: BaseDownloadInfo,Resolving{
    
    private lazy var cityRepository: CityRepository = resolver.resolve()
    private lazy var configRepository: ConfigRepository = resolver.resolve()
    
    func name() -> String{
        return "cidades"
    }
    
    func currentVersion() -> Int {
        return configRepository.currentCityVersion()
    }
    
    func serverVersion() -> Promise<EntityVersion> {
        return configRepository.getCityVersion()
    }
    
    func updateCurrentVersion(serverVersion: Int) {
        configRepository.saveCityVersion(cityVersion: serverVersion)
    }
    
    func loadInfo() -> Promise<Array<Decodable>>{
        return configRepository.loadCities()
    }
    
    func onSuccess(list: Array<Any>) -> Bool {
        var success = false
        if let parsedList = list as? Array<CityRemote> {
            do {
                try cityRepository.deleteCities()
                try cityRepository.insertCities(cities: parsedList.map{$0.toCityDB()})
                success = true
            } catch {
                success = false
            }
        }
        
        return success
        
    }
}
