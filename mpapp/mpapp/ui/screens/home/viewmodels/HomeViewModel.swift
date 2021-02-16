import Foundation
import SwiftUI
import Firebase
import RealmSwift
import RxSwift
import RxRealm
import Realm

class HomeViewModel: BaseViewModel{
    
    private let publicWorkRepository: PublicWorkRepository
    
    init(publicWorkRepository: PublicWorkRepository){
        self.publicWorkRepository = publicWorkRepository
    }
    
    func navigateToPublicWorkList(){
        self.navController.navigateTo(AnyView(PublicWorkListScreen()))
    }
    
    func navigateToSyncView(){
        self.navController.navigateTo(AnyView(SyncView()))
    }
    
    func navigateAddPublicWork(){
        self.navController.navigateTo(AnyView(PublicWorkAddView()))
    }
    
    private func publicWorksList() -> Results<PublicWork>{
        return publicWorkRepository.listAllPublicWorks().filter(createFilter()).sorted(byKeyPath: "name", ascending: true)
    }
    
    
    private func createFilter() -> NSPredicate{
        var predicates: [NSPredicate] = []
    
        predicates.append(NSPredicate(format: "self.idCollect != nil", []))
        predicates.append(NSPredicate(format: "self.toSend == YES", []))

        return NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
    }
    
    func countObjectsToSync() -> Int{
       return publicWorksList().count
    }
    
    
    func logout(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        self.navController.navigateBack()
    }
}
