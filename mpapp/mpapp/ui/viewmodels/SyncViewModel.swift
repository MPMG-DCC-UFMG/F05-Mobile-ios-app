import Foundation
import RealmSwift
import RxSwift
import RxRealm
import Realm

class SyncViewModel: ObservableObject{
    
    private let publicWorkRepository: IPublicWorkRepository
    @Published var syncWorkers: [String:SyncUI] = [:]
    
    init(publicWorkRepository: IPublicWorkRepository){
        self.publicWorkRepository = publicWorkRepository
    }
    
    func loadPublicWorksList(){
        var publicWorkListIds : Set<String> = []
        Observable.array(from: publicWorksList()).subscribe(onNext:{ array in
            array.forEach{ publicWork in
                publicWorkListIds.insert(publicWork.id)
                self.syncWorkers[publicWork.id] = SyncUI(publicWork)
            }
            
            self.syncWorkers.forEach{ key, _ in
                if(!publicWorkListIds.contains(key)){
                    self.syncWorkers.removeValue(forKey: key)
                }
            }
            
        }).dispose()
    }
    
    private func publicWorksList() -> Results<PublicWork>{
        return publicWorkRepository.listAllPublicWorks().filter(createFilter()).sorted(byKeyPath: "name", ascending: true)
    }
    
    func countObjectsToSync() -> Int{
       return publicWorksList().count
    }
    private func createFilter() -> NSPredicate{
        var predicates: [NSPredicate] = []
    
        predicates.append(NSPredicate(format: "self.idCollect != nil", []))
        predicates.append(NSPredicate(format: "self.toSend == YES", []))

        return NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
    }
    
    func startSyncPublicWorks(){
        syncWorkers.forEach{ _ , publicWork in
            publicWork.publicWorkUploader.execute()
        }
    }
}
