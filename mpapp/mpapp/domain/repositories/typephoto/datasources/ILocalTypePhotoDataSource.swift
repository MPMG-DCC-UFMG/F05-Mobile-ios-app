import Foundation
import RealmSwift

protocol ILocalTypePhotoDataSource {
    
    func insertTypePhoto(typePhoto: TypePhoto) throws

    func insertTypePhotos(typePhotos: Array<TypePhoto>) throws

    func listAllTypePhotos() -> Results<TypePhoto>
}

