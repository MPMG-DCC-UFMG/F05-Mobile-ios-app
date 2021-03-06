import Foundation
import Resolver
import PromiseKit

class DownloadAssociation: BaseDownloadInfo,Resolving{
    
    private lazy var associationRepository: AssociationRepository = resolver.resolve()
    private lazy var configRepository: ConfigRepository = resolver.resolve()
    
    func name() -> String{
        return "associações"
    }
    
    func currentVersion() -> Int {
        return configRepository.currentAssociationVersion()
    }
    
    func serverVersion() -> Promise<EntityVersion> {
        return configRepository.getAssociationTPTWVersion()
    }
    
    func updateCurrentVersion(serverVersion: Int) {
        configRepository.saveAssociationsVersion(associationVersion: serverVersion)
    }
    
    func loadInfo() -> Promise<Array<Decodable>>{
        return configRepository.loadAssociationTPTW()
    }
    
    func onSuccess(list: Array<Any>) -> Bool {
        var success = false
        if let parsedList = list as? Array<AssociationTPTWRemote> {
            do {
                try associationRepository.deleteAssociations()
                try associationRepository.insertAssociations(associations: parsedList.map{$0.toAssociationTPTWDB()})
                success = true
            } catch {
                success = false
            }
        }
        
        return success
        
    }
}

