import Foundation
import RealmSwift
import RxSwift
import RxRealm
import Realm

class PublicWorkViewModel: ObservableObject{
    
    private let publicWorkRepository: IPublicWorkRepository
    
    init(publicWorkRepository: IPublicWorkRepository){
        self.publicWorkRepository = publicWorkRepository
    }
    
    func publicWorksList(searchTerm:String = "") -> Results<PublicWork>{
        let predicate = NSPredicate(format: "name BEGINSWITH %@", searchTerm)
        return publicWorkRepository.listAllPublicWorks()
    }
    
    func addToDb(publicWork: PublicWork){
        publicWork.toSend = true
        do{
            try publicWorkRepository.insertPublicWork(publicWork: publicWork)
        }catch{
            print(error)
        }
    }
}
