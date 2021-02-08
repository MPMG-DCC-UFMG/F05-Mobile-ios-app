import Foundation
import RxSwift
import RxRealm
import RealmSwift

class TypePhotoViewModel: ObservableObject{
    
    @Published var typePhotos = [TypePhoto]()
    
    private let typePhotoRepository: TypePhotoRepository
    
    init(typePhotoRepository: TypePhotoRepository){
        self.typePhotoRepository = typePhotoRepository
        fetchTypePhotos()
    }
    
    func fetchTypePhotos() {
        Observable.array(from: typePhotoRepository.listAllTypePhotos()).subscribe(onNext:{ array in
            self.typePhotos = array
            }).dispose()
    }
}
