import Foundation
import RealmSwift
import RxSwift
import RxRealm
import Realm

class PublicWorkViewModel: ObservableObject{
    
    private let publicWorkRepository: IPublicWorkRepository
    private var sortListAscending: Bool = true
    
    @Published var selected:Int = 0
    @Published var collectToSend: Bool = true
    @Published var dataToSend: Bool = true
    @Published var searchTerm: String = ""
    @Published var filterTypeWorkFlags: [Int] = []
    
    init(publicWorkRepository: IPublicWorkRepository){
        self.publicWorkRepository = publicWorkRepository
    }
    
    func publicWorksList() -> Results<PublicWork>{
        return publicWorkRepository.listAllPublicWorks().filter(createFilter()).sorted(byKeyPath: "name", ascending: sortAscending())
    }
    
    private func sortAscending() -> Bool{
        return selected != 1
    }
    
    private func createFilter() -> NSPredicate{
        var predicates: [NSPredicate] = []
        
        if !searchTerm.isEmpty {
            predicates.append(NSPredicate(format: "name BEGINSWITH %@",searchTerm))
        }
        
        if(!collectToSend){
            predicates.append(NSPredicate(format: "self.idCollect == nil", []))
        }
        
        if(!dataToSend){
            predicates.append(NSPredicate(format: "self.toSend == NO", []))
        }
        
        if(!filterTypeWorkFlags.isEmpty){
            predicates.append(NSPredicate(format: "self.typeWorkFlag IN %@", filterTypeWorkFlags))
        }
        
        
        return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
    }
    
    func addToDb(_ publicWork: PublicWorkUI){
        do{
            try publicWorkRepository.insertPublicWork(publicWork: publicWork)
        }catch{
            print(error)
        }
    }
    
    func updateFilteredWorkFlags(filterTypeWorkFlags: [Int]){
        self.filterTypeWorkFlags = filterTypeWorkFlags
    }
}
