import Foundation
import RealmSwift
import RxSwift
import RxRealm
import Realm

class SyncViewModel: ObservableObject{
    
    private let publicWorkRepository: IPublicWorkRepository
    
    init(publicWorkRepository: IPublicWorkRepository){
        self.publicWorkRepository = publicWorkRepository
    }
    
    func publicWorksList() -> Results<PublicWork>{
        return publicWorkRepository.listAllPublicWorks().filter(createFilter()).sorted(byKeyPath: "name", ascending: true)
    }
    
    private func createFilter() -> NSPredicate{
        var predicates: [NSPredicate] = []
    
        predicates.append(NSPredicate(format: "self.idCollect != nil", []))
        predicates.append(NSPredicate(format: "self.toSend == YES", []))

        return NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
    }
}
