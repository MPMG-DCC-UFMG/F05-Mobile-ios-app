import Foundation
import Resolver
import PromiseKit

class DownloadTypePhoto: BaseDownloadInfo,Resolving{
    
    private lazy var typePhotoRepository: TypePhotoRepository = resolver.resolve()
    private lazy var configRepository: ConfigRepository = resolver.resolve()
    
    func name() -> String{
        return "tipo de foto"
    }
    
    func currentVersion() -> Int {
        return configRepository.currentTypePhotosVersion()
    }
    
    func serverVersion() -> Promise<EntityVersion> {
        return configRepository.getTypePhotosVersion()
    }
    
    func updateCurrentVersion(serverVersion: Int) {
        configRepository.saveTypePhotosVersion(typePhotosVersion: serverVersion)
    }
    
    func loadInfo() -> Promise<Array<Decodable>>{
        return configRepository.loadTypePhotos()
    }
    
    func onSuccess(list: Array<Any>) -> Bool {
        var success = false
        if let parsedList = list as? Array<TypePhotoRemote> {
            do {
                try typePhotoRepository.deleteTypePhotos()
                try typePhotoRepository.insertTypePhotos(typePhotos:  parsedList.map{$0.toTypePhotoDB()})
                success = true
            } catch {
                success = false
            }
        }
        
        return success
        
    }
}
