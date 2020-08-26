import Foundation
import Resolver
import Promises
import Gloss

class DownloadWorkStatus: BaseDownloadInfo,Resolving{
    
    private lazy var workStatusRepository: IWorkStatusRepository = resolver.resolve()
    private lazy var configRepository: IConfigRepository = resolver.resolve()
    
    func name() -> String{
        return "status da obra"
    }
    
    func currentVersion() -> Int {
        return configRepository.currentWorkStatusVersion()
    }
    
    func serverVersion() -> Promise<EntityVersion> {
        return configRepository.getWorkStatusVersion()
    }
    
    func updateCurrentVersion(serverVersion: Int) {
        configRepository.saveWorkStatusVersion(workStatusVersion: serverVersion)
    }
    
    func loadInfo() -> Promise<Array<JSONDecodable>>{
        return configRepository.loadWorkStatus()
    }
    
    func onSuccess(list: Array<Any>) -> Bool {
        var success = false
        if let parsedList = list as? Array<WorkStatusRemote> {
            do {
                try workStatusRepository.deleteWorkStatuses()
                try workStatusRepository.insertWorkStatuses(workStatuses:  parsedList.map{$0.toWorkStatusDB()})
                success = true
            } catch {
                success = false
            }
        }
        
        return success
        
    }
}
