import Foundation
import RealmSwift

class TypePhotoRepository {
   
    private let localTypePhotoDataSource: LocalTypePhotoDataSource
    
    init(localTypePhotoDataSource: LocalTypePhotoDataSource) {
        self.localTypePhotoDataSource = localTypePhotoDataSource
    }
    
    func insertTypePhoto(typePhoto: TypePhoto) throws {
        try self.localTypePhotoDataSource.insertTypePhoto(typePhoto: typePhoto)
    }
    
    func insertTypePhotos(typePhotos: Array<TypePhoto>) throws {
        try self.localTypePhotoDataSource.insertTypePhotos(typePhotos: typePhotos)
    }
    
    func listAllTypePhotos() -> Results<TypePhoto> {
        return self.localTypePhotoDataSource.listAllTypePhotos()
    }

    func deleteTypePhotos() throws {
        try self.localTypePhotoDataSource.deleteTypePhotos()
    }
}
