import Foundation

protocol ILocalPublicWorkDataSource{
    
    func insertPublicWork(publicWork: PublicWork) throws
    
    func deletePublicWork(publicWork: PublicWork) throws
    
    func insertPublicWorks(publicWorks: Array<PublicWork>) throws
    
    func deletePublicWorkById(publicWorkId: String) throws
}
