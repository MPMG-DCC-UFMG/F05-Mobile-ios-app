import Foundation
import RealmSwift
import RxSwift
import RxRealm

class PublicWorkViewModel: ObservableObject{
    
    @Published var publicWorks = [PublicWork]()
    
    private let publicWorkRepository: IPublicWorkRepository
    
    init(publicWorkRepository: IPublicWorkRepository){
        self.publicWorkRepository = publicWorkRepository
        fetchPublicWorks()
    }
    
    func fetchPublicWorks() {
        Observable.array(from: publicWorkRepository.listAllPublicWorks()).subscribe(onNext:{ array in
            self.publicWorks = array
            }).dispose()
    }
}
