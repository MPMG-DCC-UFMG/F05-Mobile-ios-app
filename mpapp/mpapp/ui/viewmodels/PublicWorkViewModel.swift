import Foundation
import RealmSwift
import RxSwift
import RxRealm
import Realm
import GeoQueries
import MapKit
import Resolver

class PublicWorkViewModel: ObservableObject{
    
    private let publicWorkRepository: IPublicWorkRepository
    private var sortListAscending: Bool = true
    
    private var locationManager: LocationManager = Resolver.resolve()
    
    @Published var selected:Int = 0
    @Published var collectToSend: Bool = true
    @Published var dataToSend: Bool = true
    @Published var searchTerm: String = ""
    @Published var filterTypeWorkFlags: [Int] = []
    
    init(publicWorkRepository: IPublicWorkRepository){
        self.publicWorkRepository = publicWorkRepository
    }
    
    func publicWorksList() -> [PublicWork]{
        let filteredResult = publicWorkRepository.listAllPublicWorks().filter(createFilter())
        if(selected==2 && locationManager.location != nil){
            let location = locationManager.location!.coordinate
            return filteredResult.sortByDistance(center: location, ascending: true)
        }
        return filteredResult.sorted(byKeyPath: "name", ascending: sortAscending()).toArray()
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
