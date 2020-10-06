import Foundation
import RealmSwift

protocol ILocalPublicWorkDataSource{
    
    func insertPublicWork(publicWork: PublicWork) throws
    
    func insertPublicWork(publicWork: PublicWorkUI) throws
    
    func deletePublicWork(publicWork: PublicWork) throws
    
    func insertPublicWorks(publicWorks: Array<PublicWork>) throws
    
    func deletePublicWorkById(publicWorkId: String) throws
    
    func listAllPublicWorks() -> Results<PublicWork>
    
    func getPublicWorkById(publicWorkId: String) -> PublicWork?
    
    func markPublicWorkCollectSent(publicWorkId: String) throws
    
    func markPublicWorkSent(publicWorkId: String) throws
}
