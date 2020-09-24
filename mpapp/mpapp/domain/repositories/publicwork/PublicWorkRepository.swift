import Foundation
import RealmSwift

class PublicWorkRepository: IPublicWorkRepository{
    
    private let localPublicWorkDataSource: ILocalPublicWorkDataSource
    
    init(localPublicWorkDataSource: ILocalPublicWorkDataSource) {
        self.localPublicWorkDataSource = localPublicWorkDataSource
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
}
