import Foundation
import PromiseKit

protocol IRemotePhotoDataSource {
    
    func sendImage(imageName: String) -> Promise<ImageUploadResponse>
    
    func sendPhoto(photo: PhotoRemote) -> Promise<ResponseRemote>
}
