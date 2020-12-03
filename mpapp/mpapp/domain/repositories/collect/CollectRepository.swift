import Foundation
import PromiseKit

class CollectRepository: ICollectRepository{
    
    private let remotePhotoDataSource: IRemotePhotoDataSource
    private let remoteCollectDataSource: IRemoteCollectDataSource
    private let localCollectDataSource: ILocalCollectDataSource
    
    init(localCollectDataSource: ILocalCollectDataSource,
         remoteCollectDataSource: IRemoteCollectDataSource,
         remotePhotoDataSource: IRemotePhotoDataSource) {
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
    

}
