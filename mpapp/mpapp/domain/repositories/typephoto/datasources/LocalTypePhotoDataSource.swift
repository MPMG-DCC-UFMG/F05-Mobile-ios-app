import Foundation
import RealmSwift

class LocalTypePhotoDataSource: BaseDataSource<TypePhoto>,ILocalTypePhotoDataSource{
    
    func insertTypePhoto(typePhoto: TypePhoto) throws {
        try self.insert(entity: typePhoto)
    }
    
    func insertTypePhotos(typePhotos: Array<TypePhoto>) throws {
        try self.insertAll(entities: typePhotos)
    }
    
    func listAllTypePhotos() -> Results<TypePhoto> {
        return self.listAll()
    }
}
