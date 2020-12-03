import Foundation
import RealmSwift
import PromiseKit

class PublicWorkRepository: IPublicWorkRepository{

    private let localPublicWorkDataSource: ILocalPublicWorkDataSource
    private let remotePublicWorkDataSource: IRemotePublicWorkDataSource
    
    init(localPublicWorkDataSource: ILocalPublicWorkDataSource,
         remotePublicWorkDataSource: IRemotePublicWorkDataSource) {
        self.localPublicWorkDataSource = localPublicWorkDataSource
        self.remotePublicWorkDataSource = remotePublicWorkDataSource
    }
    
    func insertPublicWork(publicWork: PublicWork) throws {
        try self.localPublicWorkDataSource.insertPublicWork(publicWork: publicWork)
    }
    
    func insertPublicWork(publicWork: PublicWorkUI) throws {
        try self.localPublicWorkDataSource.insertPublicWork(publicWork: publicWork)
    }
    
    func insertPublicWorks(publicWorks: Array<PublicWork>) throws {
        try self.localPublicWorkDataSource.insertPublicWorks(publicWorks: publicWorks)
    }
    
    func deletePublicWork(publicWork: PublicWork) throws {
        try self.localPublicWorkDataSource.deletePublicWork(publicWork:publicWork)
    }
    
    func deletePublicWorkById(publicWorkId: String) throws {
        try self.localPublicWorkDataSource.deletePublicWorkById(publicWorkId: publicWorkId)
    }
    
    func listAllPublicWorks() -> Results<PublicWork>{
        return self.localPublicWorkDataSource.listAllPublicWorks()
    }
    
    func getPublicWorkById(publicWorkId: String) -> PublicWork?{
        return self.localPublicWorkDataSource.getPublicWorkById(publicWorkId: publicWorkId)
    }
    
    func sendPublicWork(publicWorkRemote: PublicWorkRemote) -> Promise<ResponseRemote> {
        return self.remotePublicWorkDataSource.sendPublicWork(publicWorkRemote: publicWorkRemote)
    }
    
    func markPublicWorkCollectSent(publicWorkId: String) throws{
        try self.localPublicWorkDataSource.markPublicWorkCollectSent(publicWorkId: publicWorkId)
    }
    
    func markPublicWorkSent(publicWorkId: String) throws{
        try self.localPublicWorkDataSource.markPublicWorkSent(publicWorkId: publicWorkId)
    }
}
