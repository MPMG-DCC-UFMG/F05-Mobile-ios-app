import Foundation
import RealmSwift
import RxSwift
import RxRealm
import Realm
import GeoQueries
import MapKit
import Resolver
import SwiftUI

class PublicWorkViewModel: BaseViewModel, ObservableObject{
    
    var typeworks = [TypeWork]()
    var workStatus = [WorkStatus]()
    
    private let publicWorkRepository: PublicWorkRepository
    private let typeWorkRepository: TypeWorkRepository
    private let workStatusRepository: WorkStatusRepository
    private var sortListAscending: Bool = true
    
    private var locationManager: LocationManager = Resolver.resolve()
    
    @Published var selected:Int = 0
    @Published var collectToSend: Bool = true
    @Published var dataToSend: Bool = true
    @Published var searchTerm: String = ""
    @Published var filterTypeWorkFlags: [Int] = []
    @Published var filterWorkStatusFlags: [Int] = []
    
    init(publicWorkRepository: PublicWorkRepository, typeWorkRepository: TypeWorkRepository, workStatusRepository: WorkStatusRepository){
        self.publicWorkRepository = publicWorkRepository
        self.typeWorkRepository = typeWorkRepository
        self.workStatusRepository = workStatusRepository
        self.typeworks = typeWorkRepository.listAllTypeWorks().toArray()
        self.workStatus = workStatusRepository.listWorkStatus().toArray()
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
        
        if(!filterWorkStatusFlags.isEmpty){
            predicates.append(NSPredicate(format: "self.userStatusFlag IN %@", filterWorkStatusFlags))
        }
        
        
        return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
    }
    
    func updateFilteredWorkFlags(filterTypeWorkFlags: [Int]){
        self.filterTypeWorkFlags = filterTypeWorkFlags
    }
    
    func updateFilteredStatusFlags(filterWorkStatusFlags: [Int]){
        self.filterWorkStatusFlags = filterWorkStatusFlags
    }
    
    func navigateBack(){
        self.navController.navigateBack()
    }
    
    func navigateToCollect(publicWorkId: String){
        self.navController.navigateTo(AnyView(CollectView(publicWorkId: publicWorkId)))
    }
}
