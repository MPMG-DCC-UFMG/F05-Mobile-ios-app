import Foundation
import Resolver
import PromiseKit

class DownloadPublicWork: BaseDownloadInfo,Resolving{
    
    private lazy var publicWorkRepository: IPublicWorkRepository = resolver.resolve()
    private lazy var configRepository: IConfigRepository = resolver.resolve()
    
    func name() -> String{
        return "obras públicas"
    }
    
    func currentVersion() -> Int {
        return configRepository.currentPublicWorkVersion()
    }
    
    func serverVersion() -> Promise<EntityVersion> {
        return configRepository.getPublicWorkVersion()
    }
    
    func updateCurrentVersion(serverVersion: Int) {
        configRepository.savePublicWorkVersion(publicWorkVersion: serverVersion)
    }
    
    func loadInfo() -> Promise<Array<Decodable>>{
        return configRepository.loadPublicWorkChanges(currVersion: currentVersion())
    }
    
    func onSuccess(list: Array<Any>) -> Bool {
        var success = false
        if let parsedList = list as? Array<PublicWorkRemote> {
            do {
                try self.handlePublicWorkDiff(listPublicWorkRemote: parsedList)
                success = true
            } catch {
                success = false
            }
        }
        
        return success
    }
    
    private func handlePublicWorkDiff(listPublicWorkRemote: Array<PublicWorkRemote>) throws {
        try listPublicWorkRemote.forEach { publicWork in
            if (publicWork.operation == 2) {
                try self.publicWorkRepository.deletePublicWorkById(publicWorkId: publicWork.id)
            } else {
                try self.publicWorkRepository.insertPublicWork(publicWork: publicWork.toPublicWorkDB())
            }
        }
    }
}

