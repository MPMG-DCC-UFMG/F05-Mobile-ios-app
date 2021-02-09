import Foundation
import PromiseKit

class CollectRepository {
    
    private let remotePhotoDataSource: RemotePhotoDataSource
    private let remoteCollectDataSource: RemoteCollectDataSource
    private let localCollectDataSource: LocalCollectDataSource
    
    init(localCollectDataSource: LocalCollectDataSource,
         remoteCollectDataSource: RemoteCollectDataSource,
         remotePhotoDataSource: RemotePhotoDataSource) {
        self.localCollectDataSource = localCollectDataSource
        self.remotePhotoDataSource = remotePhotoDataSource
        self.remoteCollectDataSource = remoteCollectDataSource
    }
    
    func insertCollect(collect: Collect,publicWork: PublicWork) throws {
        try self.localCollectDataSource.insertCollect(collect: collect,publicWork:publicWork)
    }
    
    func getCollectByPublicWorkId(publicWorkId: String) -> Collect? {
        return self.localCollectDataSource.getCollectByPublicWorkId(publicWorkId: publicWorkId)
    }
    
    func getCollectByCollectId(collectId: String) -> Collect? {
        return self.localCollectDataSource.getCollectByCollectId(collectId: collectId)
    }
    
    func insertCollect(collect: CollectUI,publicWork: PublicWork,photoUI: [PhotoUI]) throws {
        try self.localCollectDataSource.insertCollect(collect: collect,publicWork:publicWork,photoUI:photoUI)
    }
    
    func deleteCollect(collect: Collect,publicWork: PublicWork) throws {
        try self.localCollectDataSource.deleteCollect(collect: collect,publicWork:publicWork)
    }
    
    func getPhotoByCollectId(collectId: String) -> [Photo]{
        return self.localCollectDataSource.getPhotoByCollectId(collectId: collectId)
    }
    
    func deletePhotoById(_ photoId: String) throws{
        try self.localCollectDataSource.deletePhotoById(photoId)
    }
    
    func sendImage(imageName: String) -> Promise<ImageUploadResponse> {
        return self.remotePhotoDataSource.sendImage(imageName: imageName)
    }
    
    func sendPhoto(photo: PhotoRemote) -> Promise<ResponseRemote> {
        return self.remotePhotoDataSource.sendPhoto(photo: photo)
    }
    
    func sendCollect(collectRemote: CollectRemote) -> Promise<ResponseRemote> {
        return self.remoteCollectDataSource.sendCollect(collectRemote: collectRemote)
    }
    
    func getPhotoById(photoId: String) -> Photo?{
        return self.localCollectDataSource.getPhotoById(photoId: photoId)
    }
    
}
