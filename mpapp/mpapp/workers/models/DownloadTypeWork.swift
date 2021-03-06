import Foundation
import Resolver
import PromiseKit

class DownloadTypeWork : BaseDownloadInfo,Resolving{
    
    private lazy var typeWorkRepository: TypeWorkRepository = resolver.resolve()
    private lazy var configRepository: ConfigRepository = resolver.resolve()
    
    func name() -> String{
        return "tipo de obra"
    }
    
    func currentVersion() -> Int {
        return configRepository.currentTypeWorksVersion()
    }
    
    func serverVersion() -> Promise<EntityVersion> {
        return configRepository.getTypeWorkVersion()
    }
    
    func updateCurrentVersion(serverVersion: Int) {
        configRepository.saveTypeWorksVersion(typeWorksVersion: serverVersion)
    }
    
    func loadInfo() -> Promise<Array<Decodable>>{
        return configRepository.loadTypeWorks()
    }
    
    func onSuccess(list: Array<Any>) -> Bool {
        var success = false
        if let parsedList = list as? Array<TypeWorkRemote> {
            do {
                try typeWorkRepository.deleteTypeWorks()
                try typeWorkRepository.insertTypeWorks(typeWorks: parsedList.map{$0.toTypeWorkDB()})
                success = true
            } catch {
                success = false
            }
        }
        
        return success
        
    }
}
